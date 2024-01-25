//
//  UserViewModel+Extensions.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 8.12.2022.
//

import DataProvider
import Components
import Foundation

extension UserViewModel {
    
    init(recipe: Recipe) {
        self.init(imageUrl: recipe.user.image?.url ?? "",
                  username: recipe.user.username ?? "",
                  stat: L10n.Modules.Home.userRecipeAndFollowerCount(recipe.user.recipeCount, recipe.user.followingCount))
    }
}
