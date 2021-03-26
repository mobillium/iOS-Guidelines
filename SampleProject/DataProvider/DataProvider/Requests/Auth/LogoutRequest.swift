//
//  LogoutRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct LogoutRequest: APIRequest {
    
    public typealias ResponseType = SuccessResponse

    public var path: String = "auth/logout"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {}
    
}
