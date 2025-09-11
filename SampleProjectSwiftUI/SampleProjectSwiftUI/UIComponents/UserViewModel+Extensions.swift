//
//  UserViewModel+Extensions.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 8.12.2022.
//

import Domain
import Components
import Foundation

extension UserViewModel {
    
    init(recipe: Recipe) {
        let stat = L10n.Home.userRecipeAndFollowerCount(recipe.user.recipeCount, recipe.user.followingCount)
        self.init(imageUrl: recipe.user.image?.url ?? "",
                  username: recipe.user.username ?? "",
                  stat: stat)
    }
}
