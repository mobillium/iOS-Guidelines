//
//  RecipeDetailRoute.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 8.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

protocol RecipeDetailRoute {
    func pushRecipeDetail()
    func placeOnWindowRecipeDetail()
}

extension RecipeDetailRoute where Self: RouterProtocol {
    
    func pushRecipeDetail() {
        let router = RecipeDetailRouter()
        let viewModel = RecipeDetailViewModel(router: router)
        let viewController = RecipeDetailViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
    
    func placeOnWindowRecipeDetail() {
        let router = RecipeDetailRouter()
        let viewModel = RecipeDetailViewModel(router: router)
        let viewController = RecipeDetailViewController(viewModel: viewModel)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
