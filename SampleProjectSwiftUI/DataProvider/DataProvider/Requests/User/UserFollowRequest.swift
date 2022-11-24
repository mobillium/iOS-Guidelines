//
//  UserFollowRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct UserFollowRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "user/{followedId}/following"
    public var method: RequestMethod = .post
    
    public init(followedId: Int, followType: FollowType) {
        self.path = "user/\(followedId)/following"
        switch followType {
        case .follow:
            method = .post
        case .unfollow:
            method = .delete
        }
    }
    
    public enum FollowType {
        case follow
        case unfollow
    }
    
}
