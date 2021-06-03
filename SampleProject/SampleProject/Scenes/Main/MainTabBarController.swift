//
//  MainTabBarController.swift
//  SampleProject
//
//  Created by Murat Celebi on 28.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = .appRed
    
        let homeViewController = createHomeViewController()
        let favoritesViewController = createFavoritesViewController()
        
        viewControllers = [
            homeViewController,
            favoritesViewController
        ]
    }
    
    private func createHomeViewController() -> UINavigationController {
        let homeRouter = HomeRouter()
        let homeViewModel = HomeViewModel(router: homeRouter)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        let navController = MainNavigationController(rootViewController: homeViewController)
        navController.tabBarItem.image = .icHome
        homeRouter.viewController = homeViewController
        return navController
    }
    
    private func createFavoritesViewController() -> UINavigationController {
        let favoritesRouter = FavoritesRouter()
        let favoritesViewModel = FavoritesViewModel(router: favoritesRouter)
        let favoritesViewController = FavoritesViewController(viewModel: favoritesViewModel)
        let navController = MainNavigationController(rootViewController: favoritesViewController)
        navController.tabBarItem.image = .icHeart
        favoritesRouter.viewController = favoritesViewController
        return navController
    }
}
