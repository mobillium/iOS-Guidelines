//
//  RecipeDetailRoute.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 8.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

protocol RecipeDetailRoute {
    func pushRecipeDetail(recipeId: Int)
    func placeOnRecipeDetail(recipeId: Int)
}

extension RecipeDetailRoute where Self: RouterProtocol {
    func pushRecipeDetail(recipeId: Int) {
        let router = RecipeDetailRouter()
        let viewModel = RecipeDetailViewModel(recipeId: recipeId, router: router)
        let viewController = RecipeDetailViewController(viewModel: viewModel)

        let transition = PushTransition()
        router.openTransition = transition
        router.viewController = viewController
        open(viewController, transition: transition)
    }
    
    func placeOnRecipeDetail(recipeId: Int) {
        let router = RecipeDetailRouter()
        let viewModel = RecipeDetailViewModel(recipeId: recipeId, router: router)
        let viewController = RecipeDetailViewController(viewModel: viewModel)
        let navController = MainNavigationController(rootViewController: viewController)
        let transition = PlaceOnWindowTransition()
        router.openTransition = transition
        router.viewController = viewController
        open(navController, transition: transition)
    }
}
