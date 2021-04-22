//
//  FavoritesRoute.swift
//  SampleProject
//
//  Created by Hüseyin Özgür on 20.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

protocol FavoritesRoute {
    func pushFavorites()
}

extension FavoritesRoute where Self: RouterProtocol {
    
    func pushFavorites() {
        let router = FavoritesRouter()
        let viewModel = FavoritesViewModel(router: router, dataProvider: APIDataProvider())
        let viewController = FavoritesViewController(viewModel: viewModel)
        let navigationController = MainNavigationController(rootViewController: viewController)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
        
//        let router = FavoritesRouter()
//        let viewModel = FavoritesViewModel(router: router)
//        let viewController = FavoritesViewController(viewModel: viewModel)
//
//        let transition = PushTransition()
//        router.viewController = viewController
//        router.openTransition = transition
//
//        open(viewController, transition: transition)
    }
}
