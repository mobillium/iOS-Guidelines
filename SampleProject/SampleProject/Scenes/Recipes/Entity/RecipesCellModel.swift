//
//  RecipesCellModel.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 27.07.2022.
//  Copyright © 2022 Mobillium. All rights reserved.
//

import Foundation

class RecipesCellModel: RecipeCellProtocol {
    
    let recipeId: Int
    let userId: Int
    let userImageUrl: String?
    let username: String?
    let userFollowerCount: Int
    let userRecipeCount: Int
    let recipeTitle: String?
    let categoryName: String?
    let recipeImageUrl: String?
    var commentCount: Int
    var likeCount: Int
    let isEditorChoice: Bool
    var followButtonTapped: VoidClosure?
    
    lazy var userRecipeAndFollowerCountText: String? = {
        return Localizable.Recipes.userStats(userRecipeCount, userFollowerCount)
    }()
    
    lazy var recipeCommnetAndLikeCountText: String? = {
        return Localizable.Recipes.recipeStats(commentCount, likeCount)
    }()
    
    init(recipe: Recipe) {
        self.recipeId = recipe.id
        self.userId = recipe.user.id
        self.userImageUrl = recipe.user.image?.url
        self.username = recipe.user.username
        self.userRecipeCount = recipe.user.recipeCount
        self.userFollowerCount = recipe.user.followingCount
        self.recipeTitle = recipe.title
        self.categoryName = recipe.category.name
        self.recipeImageUrl = recipe.images.first?.url
        self.commentCount = recipe.commentCount
        self.likeCount = recipe.likeCount
        self.isEditorChoice = recipe.isEditorChoice
    }
}
