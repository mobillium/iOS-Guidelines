//
//  RecipeLikeRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct RecipeLikeRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "recipe/{recipeId}/like"
    public var method: RequestMethod = .post
    public let likeType: LikeType
    
    public init(recipeId: Int, likeType: LikeType) {
        self.path = "recipe/\(recipeId)/like"
        self.likeType = likeType
        switch likeType {
        case .like:
            method = .post
        case .unlike:
            method = .delete
        }
    }
    
    public enum LikeType {
        case like
        case unlike
    }
    
}
