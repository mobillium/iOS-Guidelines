//
//  RecipesScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 24.11.2022.
//

import Combine
import SwiftUI
import Components
import Router
import LocalizationKit

struct RecipesScene<ViewModel: RecipesSceneModel>: View {
    
    @StateObject var viewModel: ViewModel
    @EnvironmentObject private var router: Router
    
    var body: some View {
        BaseScene(content: {
            ScrollView(.vertical) {
                ForEach(viewModel.recipes) { recipe in
                    RecipeView(
                        recipeId: recipe.id,
                        name: recipe.title ?? "",
                        category: recipe.category.name ?? "",
                        imageUrl: recipe.images.first?.url ?? "",
                        stat: L10n.Home.recipeCommnetAndLikeCount(recipe.commentCount, recipe.likeCount),
                        isEditorChoice: recipe.isEditorChoice,
                        userImageUrl: recipe.user.image?.url,
                        username: recipe.user.username,
                        userStat: L10n.Home.userRecipeAndFollowerCount(recipe.user.recipeCount, recipe.user.followingCount),
                    )
                    .onTapGesture {
                        let recipeId = recipe.id
                        let destination = RecipeDestinations.recipeDetail(recipeId: recipeId)
                        self.router.navigate(to: destination)
                    }
                }
            }
        }, viewModel: viewModel)
        .onAppear {
            Task { @MainActor in
                await viewModel.fetchRecipes()
            }
        }
    }
}

#Preview {
    let viewModel = RecipesSceneModel(listType: .editorChoiceRecipes)
    return RecipesScene(viewModel: viewModel)
}
