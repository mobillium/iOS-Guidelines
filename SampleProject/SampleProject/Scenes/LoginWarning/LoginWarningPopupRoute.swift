//
//  LoginWarningPopupRoute.swift
//  SampleProject
//
//  Created by emirhan Acısu on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

protocol LoginWarningPopupRoute {
    func presentLoginWarningPopup()
}

extension LoginWarningPopupRoute where Self: RouterProtocol {
    
    func presentLoginWarningPopup() {
        let router = LoginWarningPopupRouter()
        let viewModel = LoginWarningPopupViewModel(router: router)
        let viewController = LoginWarningPopupViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
