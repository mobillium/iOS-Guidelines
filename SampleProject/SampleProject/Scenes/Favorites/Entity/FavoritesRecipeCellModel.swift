//
//  FavoritesRecipeCellModel.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 27.07.2022.
//  Copyright © 2022 Mobillium. All rights reserved.
//

class FavoritesRecipeCellModel: RecipeSmallCellProtocol {

    let recipeId: Int
    let userId: Int
    let userImageUrl: String?
    let username: String?
    let recipeTitle: String?
    let categoryName: String?
    let recipeImageUrl: String?
    let commentCount: Int
    let likeCount: Int
    lazy var recipeCommnetAndLikeCountText: String? = {
        return Localizable.Recipes.recipeStats(commentCount, likeCount)
    }()
    let isEditorChoice: Bool
    var followButtonTapped: VoidClosure?
    
    init(recipe: Recipe) {
        self.recipeId = recipe.id
        self.userId = recipe.user.id
        self.userImageUrl = recipe.user.image?.url
        self.username = recipe.user.username
        self.recipeTitle = recipe.title
        self.categoryName = recipe.category.name
        self.recipeImageUrl = recipe.images.first?.url
        self.commentCount = recipe.commentCount
        self.likeCount = recipe.likeCount
        self.isEditorChoice = recipe.isEditorChoice
    }
}
