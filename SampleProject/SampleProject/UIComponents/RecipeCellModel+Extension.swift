//
//  RecipeCellViewModel+Extension.swift
//  SampleProject
//
//  Created by Murat Celebi on 2.06.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

extension RecipeCellModel {
    
    convenience init(recipe: Recipe) {
        self.init(recipeId: recipe.id,
                  userId: recipe.user.id,
                  userImageUrl: recipe.user.image?.url,
                  username: recipe.user.username,
                  userRecipeAndFollowerCountText: "\(recipe.user.recipeCount) Tarif \(recipe.user.followingCount) Takipçi",
                  recipeTitle: recipe.title,
                  categoryName: recipe.category.name,
                  recipeImageUrl: recipe.images.first?.url,
                  recipeCommnetAndLikeCountText: "\(recipe.commentCount) Yorum \(recipe.likeCount) Beğeni",
                  isEditorChoice: recipe.isEditorChoice)
    }
}
