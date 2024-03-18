//
//  RegisterRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

public struct RegisterRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth

    public var path: String = "auth/register"
    public var method: RequestMethod = .post
    public var bodyParameters: RequestParameters = [:]
    
    public init(username: String, email: String, password: String) {
        bodyParameters["username"] = username
        bodyParameters["email"] = email
        bodyParameters["password"] = password
    }
    
}
