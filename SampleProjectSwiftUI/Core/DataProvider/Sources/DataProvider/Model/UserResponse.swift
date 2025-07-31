//
//  UserResponse.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Domain
import Network

struct UserResponse: Decodable {
    let id: Int
    let username: String?
    let image: ImageResponse?
    let followedCount: Int
    let followingCount: Int
    let recipeCount: Int
    let isFollowing: Bool
    let favoritesCount: Int
    let likesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case image
        case followedCount = "followed_count"
        case followingCount = "following_count"
        case recipeCount = "recipe_count"
        case isFollowing = "is_following"
        case favoritesCount = "favorites_count"
        case likesCount = "likes_count"
    }
}

struct UserResonseMapper: ResponseMappable {
    typealias ResponseType = UserResponse
    typealias DomainType = User
    
    func map(from response: ResponseType) -> DomainType {
        return User(
            id: response.id,
            username: response.username,
            image: ImageResponseMapper().map(from: response.image),
            followedCount: response.followedCount,
            followingCount: response.followingCount,
            recipeCount: response.recipeCount,
            isFollowing: response.isFollowing,
            favoritesCount: response.favoritesCount,
            likesCount: response.likesCount
        )
    }
}
