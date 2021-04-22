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
    func tapSeeAllButton(categoryId: Int)
}

protocol FavoritesViewProtocol: FavoritesViewDataSource, FavoritesViewEventSource {}

final class FavoritesViewModel: BaseViewModel<FavoritesRouter>, FavoritesViewProtocol {

    var categoryWithRecipesClosure: BoolClosure?
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
        let request = GetCategoriesWithRecipesRequest(page: currentPage)
        dataProvider.request(for: request) { (result) in
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
