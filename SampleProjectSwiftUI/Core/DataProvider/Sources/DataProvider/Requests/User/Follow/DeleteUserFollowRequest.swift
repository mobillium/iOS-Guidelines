//
//  DeleteUserFollowRequest.swift
//
//
//  Created by Mehmet Salih Aslan on 2.02.2024.
//

import Network

public struct DeleteUserFollowRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "user/{followedId}/following"
    public var method: RequestMethod = .delete
    
    public init(followedId: Int) {
        self.path = "user/\(followedId)/following"
    }
}
