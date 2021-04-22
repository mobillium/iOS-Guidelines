//
//  HomeViewController.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit
import StoreKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRecipeHeaderVC()
    }

    private func addRecipeHeaderVC() {
        let router = RecipeHeaderRouter()
        let viewModel = RecipeHeaderViewModel(router: router, recipeHeaderData: [
            RecipeHeaderCellModel(imageUrl: "https://www.w3schools.com/w3images/lights.jpg"),
            RecipeHeaderCellModel(imageUrl: "https://www.w3schools.com/w3images/lights.jpg"),
            RecipeHeaderCellModel(imageUrl: "https://www.w3schools.com/w3images/lights.jpg")
        ])
        let recipeHeaderViewController = RecipeHeaderViewController(viewModel: viewModel)

        addChild(recipeHeaderViewController)
        view.addSubview(recipeHeaderViewController.view)
        recipeHeaderViewController.didMove(toParent: self)
        
        recipeHeaderViewController.view.height(300)
        recipeHeaderViewController.view.width(ScreenSize.width)
        recipeHeaderViewController.view.center(in: view)
    }

}
