//
//  ForgotPasswordRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct ForgotPasswordRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth

    public var path: String = "auth/forgot"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(email: String) {
        parameters["email"] = email
    }
    
}
