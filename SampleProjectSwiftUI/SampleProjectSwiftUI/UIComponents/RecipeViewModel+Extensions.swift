//
//  RecipeViewModel+Extensions.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 8.12.2022.
//

import Domain
import Foundation
import Components

extension RecipeViewModel {
    init(recipe: Recipe) {
        let userViewModel = UserViewModel(recipe: recipe)
        let stat = L10n.Home.recipeCommnetAndLikeCount(recipe.commentCount, recipe.likeCount)
        self.init(userViewModel: userViewModel,
                  recipeId: recipe.id,
                  name: recipe.title ?? "",
                  category: recipe.category.name ?? "",
                  imageUrl: recipe.images.first?.url ?? "",
                  stat: stat,
                  isEditorChoice: recipe.isEditorChoice)

    }
}
