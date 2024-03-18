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
    
    private let interceptor: RequestInterceptor?
    
    // MARK: - URLSession
    private let configuration: URLSessionConfiguration
    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder
    
    public init(interceptor: RequestInterceptor? = nil,
                eventMonitors: [EventMonitor] = []) {
        self.interceptor = interceptor
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
        
        return urlRequest
    }
    
    @discardableResult
    public func request<T: DecodableResponseRequest>(for request: T) async -> DecodableResult<T.ResponseType> {
        guard let urlRequest = createUrlRequest(request) else { return .failure(APIError.invalidEndpoint)}
        
        do {
            let (data, response) = try await urlSession.data(for: urlRequest)
            if let httpResponse = response as? HTTPURLResponse,
               (200 ..< 400).contains(httpResponse.statusCode),
               let response = try? jsonDecoder.decode(T.ResponseType.self, from: data) {
                return .success(response)
            } else {
                return .failure(APIError.badServerResponse)
            }
        } catch {
            return .failure(error)
        }
    }
}
