//
//  APIRequestAdapter.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Alamofire

public struct APIRequestAdapter {
        
    let method: HTTPMethod
    let parameters: Parameters
    let encoding: ParameterEncoding
    let url: String
    
    public init(method: RequestMethod, parameters: RequestParameters, encoding: RequestEncoding, url: String) {
        self.method = method.alamofireHTTPMethod
        self.parameters = parameters
        self.encoding = encoding.alamofireEncoding
        self.url = url
    }
    
}

// MARK: - Get Alamofire HTTPMethod
extension RequestMethod {
    var alamofireHTTPMethod: HTTPMethod {
        switch self {
        case .connect: return .connect
        case .delete: return .delete
        case .get: return .get
        case .head: return .head
        case .options: return .options
        case .patch: return .patch
        case .post: return .post
        case .put: return .put
        case .trace: return .trace
        }
    }
}

// MARK: - Get Alamofire ParameterEncoding
extension RequestEncoding {
    var alamofireEncoding: ParameterEncoding {
        switch self {
        case .json: return JSONEncoding.default
        case .url: return URLEncoding.default
        }
    }
}
