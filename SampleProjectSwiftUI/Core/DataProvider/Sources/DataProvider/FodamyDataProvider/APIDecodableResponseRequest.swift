//
//  APIRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

protocol APIDecodableResponseRequest: DecodableResponseRequest {}

// MARK: - RequestEncoding
extension APIDecodableResponseRequest {
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

// MARK: - url
extension APIDecodableResponseRequest {
    var url: String {
        return "https://fodamy.mobillium.com/api/" + path
    }
}

// MARK: - RequestParameters
extension APIDecodableResponseRequest {
    var bodyParameters: RequestParameters {
        return [:]
    }
    var queryParameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
extension APIDecodableResponseRequest {
    var headers: RequestHeaders {
        return [:]
    }
}
