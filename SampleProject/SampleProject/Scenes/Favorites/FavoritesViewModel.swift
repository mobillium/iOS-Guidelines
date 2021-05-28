//
//  FavoritesViewModel.swift
//  SampleProject
//
//  Created by Hüseyin Özgür on 20.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol FavoritesViewDataSource {
    
    var mainCategories: [MainCategory] { get }
    var currentPage: Int { get }
    var lastPage: Int { get }
    var categoryWithRecipesClosure: BoolClosure? { get }
    
    func getCategoryWithRecipes(categoryWithRecipesClosure: Bool)
}

protocol FavoritesViewEventSource {
    var didSuccesLogout: VoidClosure? { get set }
}

protocol FavoritesViewProtocol: FavoritesViewDataSource, FavoritesViewEventSource {
    func tapSeeAllButton(categoryId: Int)
    func userLogout()
}

final class FavoritesViewModel: BaseViewModel<FavoritesRouter>, FavoritesViewProtocol {

    var categoryWithRecipesClosure: BoolClosure?
    var didSuccesLogout: VoidClosure?
    var mainCategories: [MainCategory] = []
    var lastPage: Int = 1
    var currentPage: Int = 1 {
        didSet {
            isLoadingList = true
            getCategoryWithRecipes(categoryWithRecipesClosure: true)
        }
    }
    var isLoadingList: Bool = true

    func tapSeeAllButton(categoryId: Int) {
        router.pushRecipes(listType: .categoryRecipes(categoryId: categoryId))
    }
}

extension FavoritesViewModel {
    
    func getCategoryWithRecipes(categoryWithRecipesClosure: Bool = false) {
        showLoading?()
        let request = GetCategoriesWithRecipesRequest(page: currentPage)
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            self.isLoadingList = false
            switch result {
            case .success(let response):
                self.lastPage = response.pagination.lastPage
                self.mainCategories.append(contentsOf: response.data)
                self.categoryWithRecipesClosure?(categoryWithRecipesClosure)
            case .failure:
                print("error")
            }
        }
    }
    
    func userLogout() {
        showLoading?()
        let request = LogoutRequest()
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                self.didSuccesLogout?()
                print(response.message)
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}

extension FavoritesViewModel {
    
    func getCategoryWithRecipesCellModel(indexRow: Int) -> CategoryWithRecipesCellModel {
        
        let mainCategory = self.mainCategories[indexRow]
        let categoryWithRecipesCellModel = CategoryWithRecipesCellModel(categoryId: mainCategory.id,
                                                                        categoryImageURL: mainCategory.recipes.first?.category.imageUrl?.url,
                                                                        categoryName: mainCategory.name,
                                                                        cellItems: recipeToRecipeCellModel(recipes: mainCategory.recipes))
        return categoryWithRecipesCellModel
    }
    
    private func recipeToRecipeCellModel(recipes: [Recipe]) -> [RecipeCellModel] {
        
        var recipeCellModel: [RecipeCellModel] = []
        for recipe in recipes {
            let model = RecipeCellModel(recipeId: recipe.id,
                                        userId: recipe.user.id,
                                        userImageUrl: recipe.user.image?.url,
                                        username: recipe.user.username,
                                        userRecipeAndFollowerCountText: recipe.user.recipeCount.toString,
                                        recipeTitle: recipe.title,
                                        categoryName: recipe.category.name,
                                        recipeImageUrl: recipe.images.first?.url,
                                        recipeCommnetAndLikeCountText: recipe.likeCount.toString,
                                        isEditorChoice: recipe.isEditorChoice)
            recipeCellModel.append(model)
        }
        
        return recipeCellModel
    }
    
}
