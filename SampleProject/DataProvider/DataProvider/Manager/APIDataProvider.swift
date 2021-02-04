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
    
    public init() {}
    
    private func createRequest<T: RequestProtocol>(_ request: T) -> DataRequest {
        let adapter = APIRequestAdapter(method: request.method,
                                        parameters: request.parameters,
                                        encoding: request.encoding,
                                        url: request.url)
        let request = AF.request(adapter.url,
                                 method: adapter.method,
                                 parameters: adapter.parameters,
                                 encoding: adapter.encoding,
                                 headers: nil)
        return request
    }
    
    public func getData<T: RequestProtocol>(for request: T, result: DataProviderResult<T.ResponseType>? = nil) {
        let request = createRequest(request)
        request.validate()
        request.responseData { (response) in
            if let value = response.value {
                if let json = String(data: value, encoding: .utf8) {
                    print("Response JSON: \n\(json)")
                }
            }
        }
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
