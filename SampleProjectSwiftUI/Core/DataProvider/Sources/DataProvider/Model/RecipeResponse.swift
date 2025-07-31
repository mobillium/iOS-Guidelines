//
//  RecipeResponse.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Domain
import Network

struct RecipeResponse: Decodable {
    let id: Int
    let title: String?
    let isEditorChoice: Bool
    let likeCount: Int
    let commentCount: Int
    let user: UserResponse
    let category: CategoryDetailResponse
    let images: [ImageResponse]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case isEditorChoice = "is_editor_choice"
        case likeCount = "like_count"
        case commentCount = "comment_count"
        case user
        case category
        case images
    }
}

struct RecipeResonseMapper: ResponseMappable & Initable {
    typealias ResponseType = RecipeResponse
    typealias DomainType = Recipe
        
    func map(from response: ResponseType) -> DomainType {
        let user = UserResonseMapper().map(from: response.user)
        let category = CategoryDetailResponseMapper().map(from: response.category)
        let images = ImageResponseMapper().mapList(from: response.images)
        return Recipe(
            id: response.id,
            title: response.title,
            isEditorChoice: response.isEditorChoice,
            likeCount: response.likeCount,
            commentCount: response.commentCount,
            user: user,
            category: category,
            images: images
        )
    }
}
