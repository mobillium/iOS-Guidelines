//
//  LogoutRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct LogoutRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse

    public var path: String = "auth/logout"
    public var method: RequestMethod = .post
    
    public init() {}
    
}
