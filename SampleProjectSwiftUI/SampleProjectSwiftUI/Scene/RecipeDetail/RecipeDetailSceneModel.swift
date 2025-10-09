//
//  RecipeDetailSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 15.02.2024.
//

import Combine
import Network
import Domain
import DataProvider

@MainActor
class RecipeDetailSceneModel: BaseSceneModel {
    
    @Published var images: [ImageModel] = []
    @Published var recipeName: String = ""
    @Published var categoryName: String = ""
    @Published var timeStamp: String = ""
    @Published var isEditorChoice = false
    
    private let recipeId: Int
    private var page = 1
    private let recipeRepository = RecipeRepository(dataProvider: apiDataProvider)
    
    init(recipeId: Int) {
        self.recipeId = recipeId
        super.init()
    }
    
    func fetchRecipe() async {
        showLoading = true
        let result = await recipeRepository.getRecipeDetail(recipeId: recipeId)
        showLoading = false
        switch result {
        case .success(let response):
            images = response.images
            recipeName = response.title ?? ""
            categoryName = response.category.name ?? ""
            isEditorChoice = response.isEditorChoice
            timeStamp = response.timeDifference ?? ""
        case .failure:
//                self.showWarningToast?(error.localizedDescription)
            break
        }
    }
}
