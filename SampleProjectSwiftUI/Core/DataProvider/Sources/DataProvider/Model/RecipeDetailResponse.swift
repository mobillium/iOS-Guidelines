//
//  RecipeDetailResponse.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Domain
import Network

struct RecipeDetailResponse: Decodable {
    let id: Int
    let title: String?
    let ingredients: String?
    let instructions: String?
    let isLiked: Bool
    let timeDifference: String?
    let isEditorChoice: Bool
    let likeCount: Int
    let commentCount: Int
    let user: UserResponse
    let timeOfRecipe: RecipeTimeResponse
    let numberOfPerson: NumberOfPersonResponse
    let category: CategoryDetailResponse
    let images: [ImageResponse]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case ingredients
        case instructions = "directions"
        case isLiked = "is_liked"
        case timeDifference = "difference"
        case isEditorChoice = "is_editor_choice"
        case likeCount = "like_count"
        case commentCount = "comment_count"
        case user
        case timeOfRecipe = "time_of_recipe"
        case numberOfPerson = "number_of_person"
        case category
        case images
    }
}

struct RecipeDetailResonseMapper: ResponseMappable {
    typealias ResponseType = RecipeDetailResponse
    typealias DomainType = RecipeDetail
    
    func map(from response: ResponseType) -> DomainType {
        let user = UserResonseMapper().map(from: response.user)
        let timeOfRecipe = RecipeTimeResonseMapper().map(from: response.timeOfRecipe)
        let numberOfPerson = NumberOfPersonResonseMapper().map(from: response.numberOfPerson)
        let category = CategoryDetailResponseMapper().map(from: response.category)
        let images = ImageResponseMapper().mapList(from: response.images)
        return RecipeDetail(
            id: response.id,
            title: response.title,
            ingredients: response.ingredients,
            instructions: response.instructions,
            isLiked: response.isLiked,
            timeDifference: response.timeDifference,
            isEditorChoice: response.isEditorChoice,
            likeCount: response.likeCount,
            commentCount: response.commentCount,
            user: user,
            timeOfRecipe: timeOfRecipe,
            numberOfPerson: numberOfPerson,
            category: category,
            images: images
        )
    }
}
