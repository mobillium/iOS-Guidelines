//
//  RecipeViewModel+Extensions.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 8.12.2022.
//

import Foundation

extension RecipeViewModel {
    init(recipe: Recipe) {
        let userViewModel = UserViewModel(recipe: recipe)
        self.init(userViewModel: userViewModel,
                  name: recipe.title ?? "",
                  category: recipe.category.name ?? "",
                  imageUrl: recipe.images.first?.url ?? "",
                  stat: L10n.Modules.Home.recipeCommnetAndLikeCount(recipe.commentCount, recipe.likeCount),
                  isEditorChoice: recipe.isEditorChoice)

    }
}
