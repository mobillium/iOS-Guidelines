//
//  RecipesViewModel.swift
//  SampleProject
//
//  Created by Burak Kaya on 15.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol RecipesViewDataSource {
    var recipeCellModels: [RecipeCellModel] { get }
    var recipes: [Recipe] { get }
    var currentPage: Int { get }
    var lastPage: Int { get }
    var listType: ListType? { get }
    var recipesClosure: BoolClosure? { get }

    func getRecipes(isTypeChanged: Bool)
    func setToDefaultValues()
}

protocol RecipesViewEventSource {}

protocol RecipesViewProtocol: RecipesViewDataSource, RecipesViewEventSource {}

final class RecipesViewModel: BaseViewModel<RecipesRouter>, RecipesViewProtocol {
    var listType: ListType? {
        didSet {
            setToDefaultValues()
            getRecipes(isTypeChanged: true)
        }
    }
        
    var currentPage: Int = 1 {
        didSet {
            isLoadingList = true
            getRecipes()
        }
    }
    
    var recipesClosure: BoolClosure?
    var recipes: [Recipe] = []
    var lastPage: Int = 1
    var recipeCellModels: [RecipeCellModel] = []
    var isLoadingList: Bool = true
}

// MARK: - Network
extension RecipesViewModel {
    func getRecipes(isTypeChanged: Bool = false) {
        guard let listType = listType else { return }
        let request = GetRecipesRequest(page: currentPage, listType: listType)
        dataProvider.request(for: request) { (result) in
            self.isLoadingList = false
            switch result {
            case .success(let response):
                self.recipes += response.data
                self.lastPage = response.pagination.lastPage
                self.setRecipeCellModels(recipes: response.data)
                self.recipesClosure?(isTypeChanged)
            case .failure:
                print("error")
            }
        }
    }
    
    func setRecipeCellModels(recipes: [Recipe]) {
        for recipe in recipes {
            let recipeCellModel = RecipeCellModel(recipeId: recipe.id,
                                                  userId: recipe.user.id,
                                                  userImageUrl: recipe.user.image?.url,
                                                  username: recipe.user.username,
                                                  userRecipeAndFollowerCountText: L10n.Modules.Home.userRecipeAndFollowerCount(recipe.user.recipeCount, recipe.user.followedCount),
                                                  recipeTitle: recipe.title,
                                                  categoryName: recipe.category.name,
                                                  recipeImageUrl: recipe.images[0].url,
                                                  recipeCommnetAndLikeCountText: L10n.Modules.Home.recipeCommnetAndLikeCount(recipe.commentCount, recipe.likeCount),
                                                  isEditorChoice: recipe.isEditorChoice)
            recipeCellModels.append(recipeCellModel)
        }
    }
}

// MARK: - Helper
extension RecipesViewModel {
    func setToDefaultValues() {
        recipes = []
        recipeCellModels = []
        currentPage = 1
        lastPage = 1
    }
}
