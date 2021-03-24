//
//  HomeRoute.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit

protocol HomeRoute {
    func placeOnWindowHome()
}

extension HomeRoute where Self: RouterProtocol {
    
    func placeOnWindowHome() {
        let router = HomeRouter()
        let viewModel = HomeViewModel(router: router, dataProvider: APIDataProvider())
        let viewController = HomeViewController(viewModel: viewModel)
        let navigationController = MainNavigationController(rootViewController: viewController)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
