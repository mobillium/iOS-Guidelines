//
//  AddUserFollowRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

public struct AddUserFollowRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "user/{followedId}/following"
    public var method: RequestMethod = .post
    
    public init(followedId: Int) {
        self.path = "user/\(followedId)/following"
    }
}
