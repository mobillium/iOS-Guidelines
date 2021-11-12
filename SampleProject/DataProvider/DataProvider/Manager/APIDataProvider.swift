//
//  APIDataProvider.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Alamofire

public struct APIDataProvider: DataProviderProtocol {
    
    // Singleton
    public static let shared = APIDataProvider()
    #if DEBUG
    private let session = Session(interceptor: APIRequestInterceptor.shared, eventMonitors: [APILogger.shared])
    #else
    private let session = Session(interceptor: APIRequestInterceptor.shared)
    #endif
    
    public init() {}
    
    private func createRequest<T: RequestProtocol>(_ request: T) -> DataRequest {
        let adapter = APIRequestAdapter(request: request)
        let request = session.request(adapter.url,
                                      method: adapter.method,
                                      parameters: adapter.parameters,
                                      encoding: adapter.encoding,
                                      headers: adapter.headers)
        return request
    }
    
    public func request<T: DecodableResponseRequest>(for request: T, result: DataProviderResult<T.ResponseType>? = nil) {
        let request = createRequest(request)
        request.validate()
        request.responseDecodable(of: T.ResponseType.self) { (response) in
            switch response.result {
            case .success(let value):
                result?(.success(value))
            case .failure(let error):
                result?(.failure(error))
            }
        }
    }
    
}
