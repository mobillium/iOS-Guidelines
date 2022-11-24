//
//  LoginRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct LoginRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth

    public var path: String = "auth/login"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(username: String, password: String) {
        parameters["username"] = username
        parameters["password"] = password
    }
    
}
