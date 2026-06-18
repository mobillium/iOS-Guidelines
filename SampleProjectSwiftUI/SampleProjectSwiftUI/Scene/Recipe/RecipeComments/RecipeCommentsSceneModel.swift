//
//  RecipeCommentsSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Murat Celebi on 18.12.2025.
//

import Combine
import Network
import Domain
import DataProvider

@MainActor
class RecipeCommentsSceneModel: BaseSceneModel {
    
    @Published var recipeComments: [RecipeComment] = []
    
    private let recipeId: Int
    private var page = 1
    private let recipeRepository = RecipeRepository(dataProvider: apiDataProvider)
    
    init(recipeId: Int) {
        self.recipeId = recipeId
        super.init()
    }
    
    func fetchRecipeComments() async {
        showLoading = true
        let commentResult = await recipeRepository.getRecipeComments(recipeId: recipeId, page: page)
        showLoading = false
        
        switch commentResult {
        case .success(let response):
            recipeComments = response.data
        case .failure:
            break
        }
    }
}
