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
    @Published var user: User?
    @Published var commentCount: Int = 0
    @Published var likeCount: Int = 0
    @Published var ingredients: String = ""
    @Published var numberOfPerson: String = ""
    @Published var instructions: String = ""
    @Published var timeOfRecipe: String = ""
    
    let ingredientsTitle: String = "Malzemeler"
    let instructionsTitle: String = "Yapılışı"
    let ingredientsIconName: String = "ic_restaurant"
    let instructionsIconName: String = "ic_clock"
    
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
            user = response.user
            commentCount = response.commentCount
            likeCount = response.likeCount
            ingredients = response.ingredients ?? ""
            numberOfPerson = response.numberOfPerson.text ?? ""
            instructions = response.instructions ?? ""
            timeOfRecipe = (response.timeOfRecipe.text ?? "-") + " dk"
        case .failure:
//                self.showWarningToast?(error.localizedDescription)
            break
        }
    }
}
