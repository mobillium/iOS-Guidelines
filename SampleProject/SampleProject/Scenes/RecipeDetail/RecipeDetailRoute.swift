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
}
