//
//  WalkThroughViewModel.swift
//  SampleProject
//
//  Created by Murat Celebi on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol WalkThroughViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> WalkThroughCellProtocol
}

protocol WalkThroughViewEventSource {}

protocol WalkThroughViewProtocol: WalkThroughViewDataSource, WalkThroughViewEventSource {
    func configureCellItems()
}

final class WalkThroughViewModel: BaseViewModel<WalkThroughRouter>, WalkThroughViewProtocol {
    
    private var cellItems: [WalkThroughCellProtocol] = []
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> WalkThroughCellProtocol {
        return cellItems[indexPath.row]
    }
    
    func configureCellItems() {
        let firstTitle = "Welcome to Fodamy Network!"
        let secondTitle = "Finding recipes were not that easy."
        let thirdTitle = "Add new recipe."
        let fourthTitle = "Share recipes with others."
        let descriptionText = "Fodamy is the best place to find your \n favorite recipes in all around the world."
        
        let firstOnboardingPage = WalkThroughCellModel(image: .imgWalkthrough1, titleText: firstTitle, descriptionText: descriptionText)
        let secondOnboardingPage = WalkThroughCellModel(image: .imgWalkthrough2, titleText: secondTitle, descriptionText: descriptionText)
        let thirdOnboardingPage = WalkThroughCellModel(image: .imgWalkthrough3, titleText: thirdTitle, descriptionText: descriptionText)
        let fourthOnboardingPage = WalkThroughCellModel(image: .imgWalkthrough4, titleText: fourthTitle, descriptionText: descriptionText)
        
        let onboardingPages = [firstOnboardingPage, secondOnboardingPage, thirdOnboardingPage, fourthOnboardingPage]
        
        cellItems.append(contentsOf: onboardingPages)
    }
    
}
