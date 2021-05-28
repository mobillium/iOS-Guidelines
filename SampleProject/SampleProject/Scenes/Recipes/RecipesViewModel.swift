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
    var isLoadingList: Bool { get }
    var recipesClosure: VoidClosure? { get }

    func getRecipes()
    func setToDefaultValues()
}

protocol RecipesViewEventSource {}

protocol RecipesViewProtocol: RecipesViewDataSource, RecipesViewEventSource {
    func didSelectRecipe(at indexPath: IndexPath)
}

final class RecipesViewModel: BaseViewModel<RecipesRouter>, RecipesViewProtocol {
    
    var lastPage: Int = 1
    var recipes: [Recipe] = []
    var isLoadingList = true
    var recipesClosure: VoidClosure?
    var recipeCellModels: [RecipeCellModel] = []
    
    var listType: ListType? {
        didSet {
            setToDefaultValues()
            getRecipes()
        }
    }
        
    var currentPage: Int = 1 {
        didSet {
            getRecipes()
        }
    }
    
    func didSelectRecipe(at indexPath: IndexPath) {
        let recipeId = recipes[indexPath.row].id
        router.pushRecipeDetail(recipeId: recipeId)
    }
}

// MARK: - Network
extension RecipesViewModel {
    func getRecipes() {
        guard let listType = listType else { return }
        showLoading?()
        let request = GetRecipesRequest(page: currentPage, listType: listType)
        isLoadingList = true
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            self.isLoadingList = false
            switch result {
            case .success(let response):
                self.recipes += response.data
                self.lastPage = response.pagination.lastPage
                self.setRecipeCellModels(recipes: response.data)
                self.recipesClosure?()
            case .failure:
                print("error")
            }
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
