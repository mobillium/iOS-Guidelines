//
//  AddUserFollowRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

struct AddUserFollowRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = SuccessResponse
    
    var path: String = "user/{followedId}/following"
    var method: RequestMethod = .post
    
    init(followedId: Int) {
        self.path = "user/\(followedId)/following"
    }
}
