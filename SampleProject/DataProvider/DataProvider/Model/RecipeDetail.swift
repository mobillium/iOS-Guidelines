//
//  RecipeDetail.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct RecipeDetail: Decodable {
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
    public let images: [Image]
    
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
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        title = try? values.decode(String.self, forKey: .title)
        ingredients = try? values.decode(String.self, forKey: .ingredients)
        instructions = try? values.decode(String.self, forKey: .instructions)
        if let isLiked = try? values.decode(Bool.self, forKey: .isLiked) {
            self.isLiked = isLiked
        } else {
            self.isLiked = false
        }
        timeDifference = try? values.decode(String.self, forKey: .timeDifference)
        if let isEditorChoice = try? values.decode(Bool.self, forKey: .isEditorChoice) {
            self.isEditorChoice = isEditorChoice
        } else {
            self.isEditorChoice = false
        }
        if let likeCount = try? values.decode(Int.self, forKey: .likeCount) {
            self.likeCount = likeCount
        } else {
            self.likeCount = 0
        }
        if let commentCount = try? values.decode(Int.self, forKey: .commentCount) {
            self.commentCount = commentCount
        } else {
            self.commentCount = 0
        }
        user = try values.decode(User.self, forKey: .user)
        timeOfRecipe = try values.decode(RecipeTime.self, forKey: .timeOfRecipe)
        numberOfPerson = try values.decode(NumberOfPerson.self, forKey: .numberOfPerson)
        category = try values.decode(CategoryDetail.self, forKey: .category)
        images = try values.decode([Image].self, forKey: .images)
    }
}
