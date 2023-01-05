//
//  FavoritesSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 20.10.2022.
//

import Combine

struct MainCategoryViewModel: Identifiable {
    var id = UUID()
    var title: String?
    var viewModels: [RecipeViewModel]
    
    init(id: UUID = UUID(), title: String? = nil, viewModels: [RecipeViewModel]) {
        self.id = id
        self.title = title
        self.viewModels = viewModels
    }
}

class FavoritesSceneModel: BaseSceneModel {
    
    @Published var viewModels: [MainCategoryViewModel] = []
    
    private var page = 1
    
    func fetchRecipes() {
        showLoading = true
        let request = GetCategoriesWithRecipesRequest(page: 1)
        apiDataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.showLoading = false
            switch result {
            case .success(let response):
                let viewModels = response.data.map({ MainCategoryViewModel(title: $0.name,
                                                                           viewModels: $0.recipes.map({ RecipeViewModel(recipe: $0) })) })
                self.viewModels = viewModels
            case .failure:
                //               self.showWarningToast?(error.localizedDescription)
                break
            }
        }
    }
}
