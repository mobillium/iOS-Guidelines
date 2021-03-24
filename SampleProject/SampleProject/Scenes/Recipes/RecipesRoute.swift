//
//  RecipesRoute.swift
//  Fodamy
//
//  Created by Catalina on 18.01.2021.
//

import UIKit

protocol RecipesRoute {
    func pushRecipesViewController()
}

extension RecipesRoute where Self: RouterProtocol {    
    func pushRecipesViewController() {
        let router = RecipesRouter()
        let viewModel = RecipesViewModel(router: router)
        let viewController = RecipesViewController(viewModel: viewModel)
        
        let transition = PushTransition()        
        router.openTransition = transition
        router.viewController = viewController
        open(viewController, transition: transition)
    }
}
