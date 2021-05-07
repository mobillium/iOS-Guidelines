//
//  WalkThroughRoute.swift
//  SampleProject
//
//  Created by Murat Celebi on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

protocol WalkThroughRoute {
    func placeOnWindowWalkThrough()
}

extension WalkThroughRoute where Self: RouterProtocol {
    
    func placeOnWindowWalkThrough() {
        let router = WalkThroughRouter()
        let viewModel = WalkThroughViewModel(router: router)
        let viewController = WalkThroughViewController(viewModel: viewModel)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
