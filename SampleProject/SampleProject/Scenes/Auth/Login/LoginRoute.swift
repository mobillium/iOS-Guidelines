//
//  LoginRoute.swift
//  SampleProject
//
//  Created by tunay alver on 15.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

protocol LoginRoute {
    func placeLoginOnWindow()
}

extension LoginRoute where Self: RouterProtocol {
    
    func placeLoginOnWindow() {
        let router = LoginRouter()
        let viewModel = LoginViewModel(router: router)
        let viewController = LoginViewController(viewModel: viewModel)
        let navigationController = TransparentNavigationController(rootViewController: viewController)
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
