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

struct RecipesScene<ViewModel: RecipesSceneModel>: View {
    
    @StateObject var viewModel: ViewModel
    @EnvironmentObject private var router: Router
    
    var body: some View {
        BaseScene(content: {
            ScrollView(.vertical) {
                ForEach(viewModel.viewModels) { viewModel in
                    RecipeView(viewModel: viewModel)
                        .onTapGesture {
                            let recipeId = viewModel.recipeId
                            let destination = HomeDestinations.recipeDetail(recipeId: recipeId)
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
