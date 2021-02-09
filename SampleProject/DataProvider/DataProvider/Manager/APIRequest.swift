//
//  APIRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public typealias APIRequest = RequestProtocol

public extension APIRequest {
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

public extension APIRequest {
    var url: String {
        return "baseurl" + path
    }
}
