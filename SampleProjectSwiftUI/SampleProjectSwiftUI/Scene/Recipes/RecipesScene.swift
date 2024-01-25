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
                }
            }
        }, viewModel: viewModel)
        .onAppear {
            viewModel.fetchRecipes()
        }
    }
}

struct RecipesScene_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RecipesSceneModel(listType: .editorChoiceRecipes)
        return RecipesScene(viewModel: viewModel)
    }
}
