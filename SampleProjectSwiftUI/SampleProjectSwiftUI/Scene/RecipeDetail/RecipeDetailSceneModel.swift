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
import AssetsKit
import Components

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
    @Published var recipeComments: [RecipeComment] = []
    
    let ingredientsTitle: String = "Malzemeler"
    let instructionsTitle: String = "Yapılışı"
    let ingredientsImage: ImageComponent = ImageComponent(imageName: "ic_restaurant", bundle: .assetsKit)
    let instructionsImage: ImageComponent = ImageComponent(imageName: "ic_clock", bundle: .assetsKit)
    
    let recipeId: Int
    private var page = 1
    private let recipeRepository = RecipeRepository(dataProvider: apiDataProvider)
    
    init(recipeId: Int) {
        self.recipeId = recipeId
        super.init()
    }
    
    func fetchRecipe() async {
        showLoading = true
        let result = await recipeRepository.getRecipeDetail(recipeId: recipeId)
        let commentResult = await recipeRepository.getRecipeComments(recipeId: recipeId, page: 1)
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
        
        switch commentResult {
        case .success(let response):
            recipeComments = response.data
        case .failure:
            break
        }
    }

    func followUser() {
        // TODO: Implement follow/unfollow network request
    }

    func likeRecipe() {
        // TODO: Implement like network request
    }
}
