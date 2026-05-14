//
//  APIDataProvider.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Foundation
import Network
import Alamofire

public enum APIError: Error {
    case invalidEndpoint
    case badServerResponse
    case networkError(error: Error)
    case parsing(error: Error)
}

public struct APIDataProvider: DataProviderProtocol {
    
    public var networkLogger: (any NetworkLogger)?
    private let interceptor: RequestInterceptor?
    
    // MARK: - URLSession
    private let configuration: URLSessionConfiguration
    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder
    
    public init(interceptor: RequestInterceptor? = nil,
                networkLogger: NetworkLogger? = APILogger(label: "FodamyDataProvider")) {
        self.interceptor = interceptor
        self.networkLogger = networkLogger
        self.configuration = URLSessionConfiguration.default
        self.configuration.timeoutIntervalForRequest = 20
        self.configuration.timeoutIntervalForResource = 45
        self.urlSession = URLSession(configuration: configuration)
        self.jsonDecoder = JSONDecoder()
    }
    
    private func createUrlRequest<T: RequestProtocol>(_ request: T) -> URLRequest? {
        guard
            let url = URL(string: request.url),
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        else {
            return nil
        }
        
        if !request.queryParameters.isEmpty {
            let queryItems = request.queryParameters.map({ URLQueryItem(name: $0.0, value: String(describing: $0.1)) })
            components.queryItems = queryItems
        }
        
        guard let url = components.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        if !request.bodyParameters.isEmpty {
            let jsonData = try? JSONSerialization.data(withJSONObject: request.bodyParameters, options: [])
            urlRequest.httpBody = jsonData
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return urlRequest
    }
    
    private func adaptRequest(_ urlRequest: URLRequest) async -> URLRequest {
        guard let interceptor else { return urlRequest }
        return await withCheckedContinuation { continuation in
            interceptor.adapt(urlRequest, for: Session.default) { result in
                switch result {
                case .success(let adapted):
                    continuation.resume(returning: adapted)
                case .failure:
                    continuation.resume(returning: urlRequest)
                }
            }
        }
    }

    @discardableResult
    public func request<T: DecodableResponseRequest>(for request: T) async -> DecodableResult<T.ResponseType> {
        guard let baseRequest = createUrlRequest(request) else { return .failure(APIError.invalidEndpoint) }
        let urlRequest = await adaptRequest(baseRequest)

        do {
            let (data, response) = try await urlSession.data(for: urlRequest)
            networkLogger?.log(request: urlRequest, data: data, response: response as? HTTPURLResponse, error: nil)
            
            if let httpResponse = response as? HTTPURLResponse,
               (200 ..< 400).contains(httpResponse.statusCode),
               let response = try? jsonDecoder.decode(T.ResponseType.self, from: data) {
                return .success(response)
            } else {
                return .failure(APIError.badServerResponse)
            }
        } catch {
            networkLogger?.log(request: nil, data: nil, response: nil, error: error)
            return .failure(error)
        }
    }
    
    // swiftlint:disable line_length
    public func request<T: DecodableResponseRequest, M: ResponseMappable>(for request: T, mapper: M) async -> NetworkResult<M.DomainType> where T.ResponseType == M.ResponseType {
        let result = await self.request(for: request)
        
        switch result {
        case .success(let response):
            let responseModel = mapper.map(from: response)
            return .success(responseModel)
        case .failure(let error):
            return .failure(error)
        }
    }
    // swiftlint:enable line_length
}
