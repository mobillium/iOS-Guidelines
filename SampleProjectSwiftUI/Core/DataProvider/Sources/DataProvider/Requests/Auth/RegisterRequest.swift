//
//  RegisterRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

struct RegisterRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = AuthResponse
    
    var path: String = "auth/register"
    var method: RequestMethod = .post
    var bodyParameters: RequestParameters = [:]
    
    init(username: String, email: String, password: String) {
        bodyParameters["username"] = username
        bodyParameters["email"] = email
        bodyParameters["password"] = password
    }
}
