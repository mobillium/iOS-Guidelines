//
//  UserUnFollowRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.11.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

public struct UserUnFollowRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "user/{followedId}/following"
    public var method: RequestMethod = .delete
    
    public init(followedId: Int) {
        self.path = "user/\(followedId)/following"
    }
}
