//
//  DeleteUserFollowRequest.swift
//
//
//  Created by Mehmet Salih Aslan on 2.02.2024.
//

import Network

struct DeleteUserFollowRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = SuccessResponse
    
    var path: String = "user/{followedId}/following"
    var method: RequestMethod = .delete
    
    init(followedId: Int) {
        self.path = "user/\(followedId)/following"
    }
}
