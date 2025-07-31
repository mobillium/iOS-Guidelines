//
//  RecipeDetail.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct RecipeDetail {
    public let id: Int
    public let title: String?
    public let ingredients: String?
    public let instructions: String?
    public let isLiked: Bool
    public let timeDifference: String?
    public let isEditorChoice: Bool
    public let likeCount: Int
    public let commentCount: Int
    public let user: User
    public let timeOfRecipe: RecipeTime
    public let numberOfPerson: NumberOfPerson
    public let category: CategoryDetail
    public let images: [ImageModel]
    
    public init(id: Int,
                title: String?,
                ingredients: String?,
                instructions: String?,
                isLiked: Bool,
                timeDifference: String?,
                isEditorChoice: Bool,
                likeCount: Int,
                commentCount: Int,
                user: User,
                timeOfRecipe: RecipeTime,
                numberOfPerson: NumberOfPerson,
                category: CategoryDetail,
                images: [ImageModel]) {
        self.id = id
        self.title = title
        self.ingredients = ingredients
        self.instructions = instructions
        self.isLiked = isLiked
        self.timeDifference = timeDifference
        self.isEditorChoice = isEditorChoice
        self.likeCount = likeCount
        self.commentCount = commentCount
        self.user = user
        self.timeOfRecipe = timeOfRecipe
        self.numberOfPerson = numberOfPerson
        self.category = category
        self.images = images
    }
    
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
