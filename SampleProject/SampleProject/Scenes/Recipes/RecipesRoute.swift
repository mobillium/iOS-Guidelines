//
//  RecipesRoute.swift
//  SampleProject
//
//  Created by Burak Kaya on 15.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

protocol RecipesRoute {
    func pushRecipes(listType: ListType)
}

extension RecipesRoute where Self: RouterProtocol {
    func pushRecipes(listType: ListType) {
        let router = RecipesRouter()
        let viewModel = RecipesViewModel(router: router)
        viewModel.listType = listType
        let viewController = RecipesViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
