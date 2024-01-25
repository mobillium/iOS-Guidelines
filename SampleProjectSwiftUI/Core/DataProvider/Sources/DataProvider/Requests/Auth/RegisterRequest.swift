//
//  RegisterRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct RegisterRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth

    public var path: String = "auth/register"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(username: String, email: String, password: String) {
        parameters["username"] = username
        parameters["email"] = email
        parameters["password"] = password
    }
    
}
