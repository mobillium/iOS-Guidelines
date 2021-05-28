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
            generateNavigationController(for: homeViewController, image: .icHome),
            generateNavigationController(for: favoritesViewController, image: .icHeart)
        ]
    }
    
    private func generateNavigationController(for rootViewController: UIViewController, image: UIImage) -> UIViewController {
        let navController = MainNavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = image
        return navController
    }
    
    private func createHomeViewController() -> UIViewController {
        let homeRouter = HomeRouter()
        let homeViewModel = HomeViewModel(router: homeRouter)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        homeRouter.viewController = homeViewController
        return homeViewController
    }
    
    private func createFavoritesViewController() -> UIViewController {
        let favoritesRouter = FavoritesRouter()
        let favoritesViewModel = FavoritesViewModel(router: favoritesRouter)
        let favoritesViewController = FavoritesViewController(viewModel: favoritesViewModel)
        favoritesRouter.viewController = favoritesViewController
        return favoritesViewController
    }
}
