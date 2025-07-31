//
//  LoginRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

struct LoginRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = AuthResponse

    var path: String = "auth/login"
    var method: RequestMethod = .post
    var bodyParameters: RequestParameters = [:]
    
    init(username: String, password: String) {
        bodyParameters["username"] = username
        bodyParameters["password"] = password
    }
}
