//
//  RecipesRoute.swift
//  SampleProject
//
//  Created by Burak Kaya on 15.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

protocol RecipesRoute {
    func pushRecipes(categoryId: Int, title: String)
}

extension RecipesRoute where Self: RouterProtocol {
    
    func pushRecipes(categoryId: Int, title: String) {
        let router = RecipesRouter()
        let viewModel = RecipesViewModel(recipesListingType: .categoryRecipes(categoryId: categoryId), router: router)
        viewModel.title = title
        let viewController = RecipesViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.openTransition = transition
        router.viewController = viewController
        open(viewController, transition: transition)
    }
}
