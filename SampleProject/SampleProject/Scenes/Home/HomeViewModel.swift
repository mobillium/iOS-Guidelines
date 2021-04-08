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
    var listType: ListType { get }

    func getRecipes(closure: @escaping VoidClosure)
}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {

}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {

    var listType: ListType = .editorChoiceRecipes
    
    var recipes: [Recipe] = []
    
    var currentPage: Int = 1

    lazy var recipeCellModels: [RecipeCellModel] = []
    
    var segmentedControlTitles: [String] = ["EDİTÖR SEÇİMİ", "SON EKLENENLER"]
    
    func getRecipes(closure: @escaping VoidClosure) {
        let request = GetRecipesRequest(page: currentPage, listType: listType)
        dataProvider.request(for: request) { (result) in
            switch result {
            case .success(let response):
                self.recipes = response.data
                self.setRecipeCellModels()
                closure()
            case .failure:
                print("error")
            }
        }
    }
    
    func setRecipeCellModels() {
        for recipe in recipes {
            let recipeCellModel = RecipeCellModel(recipeId: recipe.id,
                                                  userId: recipe.user.id,
                                                  userImageUrl: recipe.user.image?.url,
                                                  username: recipe.user.username,
                                                  userRecipeAndFollowerCountText: "\(recipe.user.recipeCount) Tarif \(recipe.user.followedCount) Takipçi",
                                                  recipeTitle: recipe.title,
                                                  categoryName: recipe.category.name,
                                                  recipeImageUrl: recipe.images[0].url,
                                                  recipeCommnetAndLikeCountText: "\(recipe.commentCount) Yorum \(recipe.likeCount) Beğeni",
                                                  isEditorChoice: recipe.isEditorChoice)
            recipeCellModels.append(recipeCellModel)
        }
    }
}
