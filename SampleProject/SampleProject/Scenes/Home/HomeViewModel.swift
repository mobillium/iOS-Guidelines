//
//  HomeViewModel.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Foundation

protocol HomeViewDataSource {
    var segmentedControlTitles: [String] { get }
    var recipeCellModels: [RecipeCellModel] { get }
    var recipes: [Recipe] { get }
    var currentPage: Int { get }
    var lastPage: Int { get }
    var listType: ListType { get }
    var recipesClosure: BoolClosure? { get }

    func getRecipes(isTypeChanged: Bool)
    func setToDefaultValues()
}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {

    var listType: ListType = .editorChoiceRecipes {
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
    var segmentedControlTitles: [String] = [L10n.Modules.Home.editorChoiceRecipes,
                                            L10n.Modules.Home.lastAddedRecipes]
    var isLoadingList: Bool = true
}

// MARK: - Network
extension HomeViewModel {
    func getRecipes(isTypeChanged: Bool = false) {
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
extension HomeViewModel {
    func setToDefaultValues() {
        recipes = []
        recipeCellModels = []
        currentPage = 1
        lastPage = 1
    }
}
