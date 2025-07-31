//
//  User.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct User {
    public let id: Int
    public let username: String?
    public let image: ImageModel?
    public let followedCount: Int
    public let followingCount: Int
    public let recipeCount: Int
    public let isFollowing: Bool
    public let favoritesCount: Int
    public let likesCount: Int
    
    public init(id: Int,
                username: String?,
                image: ImageModel?,
                followedCount: Int,
                followingCount: Int,
                recipeCount: Int,
                isFollowing: Bool,
                favoritesCount: Int,
                likesCount: Int) {
        self.id = id
        self.username = username
        self.image = image
        self.followedCount = followedCount
        self.followingCount = followingCount
        self.recipeCount = recipeCount
        self.isFollowing = isFollowing
        self.favoritesCount = favoritesCount
        self.likesCount = likesCount
    }
}
