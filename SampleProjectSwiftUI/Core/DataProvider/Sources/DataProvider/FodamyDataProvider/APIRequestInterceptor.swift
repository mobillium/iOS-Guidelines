//
//  ApiRequestInterceptor.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 15.11.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation
import Alamofire
import KeychainSwift

public class APIRequestInterceptor: RequestInterceptor {
    
    public static let shared = APIRequestInterceptor()
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest

        if let accessToken = TokenStorage.token {
            urlRequest.setValue(accessToken, forHTTPHeaderField: "X-Fodamy-Token")
        }

        completion(.success(urlRequest))
    }
    
    public func retry(_ request: Request, for session: Session, dueTo error: any Error, completion: @escaping (RetryResult) -> Void) {
        // todo
    }
}
