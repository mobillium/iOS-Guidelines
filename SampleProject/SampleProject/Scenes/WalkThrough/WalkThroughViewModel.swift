//
//  WalkThroughViewModel.swift
//  SampleProject
//
//  Created by Murat Celebi on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation
import MobilliumUserDefaults

protocol WalkThroughViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> WalkThroughCellProtocol
}

protocol WalkThroughViewEventSource {}

protocol WalkThroughViewProtocol: WalkThroughViewDataSource, WalkThroughViewEventSource {
    func configureCellItems()
    func didFinishWalkThroughScene()
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
        let firstOnboardingPage = WalkThroughCellModel(image: .imgWalkthrough1,
                                                       titleText: L10n.Modules.WalkThrough.firstTitle,
                                                       descriptionText: L10n.Modules.WalkThrough.descriptionText)
        let secondOnboardingPage = WalkThroughCellModel(image: .imgWalkthrough2,
                                                        titleText: L10n.Modules.WalkThrough.secondTitle,
                                                        descriptionText: L10n.Modules.WalkThrough.descriptionText)
        let thirdOnboardingPage = WalkThroughCellModel(image: .imgWalkthrough3,
                                                       titleText: L10n.Modules.WalkThrough.thirdTitle,
                                                       descriptionText: L10n.Modules.WalkThrough.descriptionText)
        let fourthOnboardingPage = WalkThroughCellModel(image: .imgWalkthrough4,
                                                        titleText: L10n.Modules.WalkThrough.fourthTitle,
                                                        descriptionText: L10n.Modules.WalkThrough.descriptionText)
        
        let onboardingPages = [firstOnboardingPage, secondOnboardingPage, thirdOnboardingPage, fourthOnboardingPage]
        
        cellItems.append(contentsOf: onboardingPages)
    }
    
    func didFinishWalkThroughScene() {
        DefaultsKey.isWalkThroughCompleted.value = true
        router.placeOnWindowHome()
    }
    
}
