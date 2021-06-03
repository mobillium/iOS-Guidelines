//
//  APIRequestInterceptor.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 26.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Alamofire
import KeychainSwift
import Utilities

public class APIRequestInterceptor: RequestInterceptor {
    
    public static let shared = APIRequestInterceptor()
    
    public var accessToken = KeychainSwift().get(Keychain.token)
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        if let accessToken = accessToken {
            urlRequest.headers.add(name: "X-Fodamy-Token", value: accessToken)
        }
        completion(.success(urlRequest))
    }
}
