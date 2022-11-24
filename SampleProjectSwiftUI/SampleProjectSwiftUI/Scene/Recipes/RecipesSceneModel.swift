//
//  RecipesSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 24.11.2022.
//

import Combine

class RecipesSceneModel: BaseSceneModel {
    
    @Published var viewModels: [RecipeViewModel] = []
    
    let listType: ListType
    private var page = 1
    
    init(listType: ListType) {
        self.listType = listType
    }
    
    func fetchRecipes() {
        showLoading = true
        var request: GetRecipesRequest
        switch listType {
        case .editorChoiceRecipes:
            request = GetRecipesRequest(page: page, listType: .editorChoiceRecipes)
        case .lastAddedRecipes:
            request = GetRecipesRequest(page: page, listType: .lastAddedRecipes)
        case .categoryRecipes(let categoryId):
            request = GetRecipesRequest(page: page, listType: .categoryRecipes(categoryId: categoryId))
        }
        apiDataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.showLoading = false
            switch result {
            case .success(let response):
                let viewModels = response.data.map({ RecipeViewModel(userViewModel: UserViewModel(imageUrl: $0.user.image?.url ?? "",
                                                                                                  username: $0.user.username ?? "",
                                                                                                  stat: "\($0.user.recipeCount) Tarif \($0.user.followedCount) Takipçi"),
                                                                     name: $0.title ?? "",
                                                                     category: $0.category.name ?? "",
                                                                     imageUrl: $0.images.first?.url ?? "",
                                                                     stat: "\($0.commentCount) Yorum \($0.likeCount) Beğeni")})
                self.viewModels.append(contentsOf: viewModels)
            case .failure:
//                self.showWarningToast?(error.localizedDescription)
                break
            }
        }
    }
    
}
