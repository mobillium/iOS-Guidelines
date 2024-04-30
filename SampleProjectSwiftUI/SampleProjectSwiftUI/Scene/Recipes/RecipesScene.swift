//
//  RecipesScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 24.11.2022.
//

import Combine
import SwiftUI
import Components

struct RecipesScene<ViewModel: RecipesSceneModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        BaseScene(content: {
            ScrollView(.vertical) {
                ForEach(viewModel.viewModels) { viewModel in
                    RecipeView(viewModel: viewModel)
                        .onTapGesture {
                            self.viewModel.recipeDidTapped(viewModel: viewModel)
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
    let viewModel = RecipesSceneModel(dataProvider: apiDataProvider, listType: .editorChoiceRecipes)
    return RecipesScene(viewModel: viewModel)
}
