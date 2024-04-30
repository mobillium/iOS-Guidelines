//
//  FavoritesSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 20.10.2022.
//

import Foundation
import Components
import Network
import DataProvider
import Combine

struct MainCategoryViewModel: Identifiable {
    var id = UUID()
    var title: String?
    var headerViewModel: HorizontalRecipesHeaderViewModel
    var recipesViewModel: HorizontalRecipesViewModel
    
    init(id: UUID = UUID(), categoryImageUrl: String?, title: String? = nil, viewModels: [RecipeViewModel]) {
        self.id = id
        let headerViewModel = HorizontalRecipesHeaderViewModel(categoryImageUrl: categoryImageUrl ?? "", title: title)
        self.headerViewModel = headerViewModel
        self.recipesViewModel = HorizontalRecipesViewModel(viewModels: viewModels)
    }
}

@MainActor
class FavoritesSceneModel: BaseSceneModel {
    
    @Published var viewModels: [MainCategoryViewModel] = []
    private let recipeRepository = RecipeRepository(dataProvider: apiDataProvider)
    private var page = 1
    
    func fetchRecipes() async {
        showLoading = true
        let result = await recipeRepository.getCategoriesWithRecipes(page: 1)
        self.showLoading = false
        switch result {
        case .success(let response):
            let viewModels = response.data
                .filter({ !$0.recipes.isEmpty })
                .map({ MainCategoryViewModel(categoryImageUrl: $0.image?.url,
                                             title: $0.name,
                                             viewModels: $0.recipes.map({ RecipeViewModel(recipe: $0) })) })
            self.viewModels = viewModels
        case .failure:
            //               self.showWarningToast?(error.localizedDescription)
            break
        }
    }
}
