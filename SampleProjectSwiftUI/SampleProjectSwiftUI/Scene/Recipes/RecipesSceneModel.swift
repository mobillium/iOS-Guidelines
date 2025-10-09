//
//  RecipesSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 24.11.2022.
//

import Foundation
import Combine
import Components
import DataProvider
import Network
import SwiftUI
import Domain

@MainActor
class RecipesSceneModel: BaseSceneModel {
    
    @Published var viewModels: [RecipeViewModel] = []
    
    let listType: RecipeListType
    private var page = 1
    private let recipeRepository = RecipeRepository(dataProvider: apiDataProvider)
    
    init(listType: RecipeListType) {
        self.listType = listType
        super.init()
    }
    
    func fetchRecipes() async {
        showLoading = true
        let result = await recipeRepository.getRecipes(page: page, listType: listType)
        showLoading = false
        switch result {
        case .success(let response):
            let viewModels = response.data.map({ RecipeViewModel(recipe: $0) })
            self.viewModels.append(contentsOf: viewModels)
        case .failure:
//                self.showWarningToast?(error.localizedDescription)
            break
        }
    }
}
