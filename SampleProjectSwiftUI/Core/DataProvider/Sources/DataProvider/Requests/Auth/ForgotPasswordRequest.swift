//
//  ForgotPasswordRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

struct ForgotPasswordRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = AuthResponse

    var path: String = "auth/forgot"
    var method: RequestMethod = .post
    var bodyParameters: RequestParameters = [:]
    
    init(email: String) {
        bodyParameters["email"] = email
    }
}
