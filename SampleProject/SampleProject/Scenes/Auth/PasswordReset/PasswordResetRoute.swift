//
//  PasswordResetRoute.swift
//  SampleProject
//
//  Created by Murat Celebi on 31.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

protocol PasswordResetRoute {
    func pushPasswordReset()
}

extension PasswordResetRoute where Self: RouterProtocol {
    
    func pushPasswordReset() {
        let router = PasswordResetRouter()
        let viewModel = PasswordResetViewModel(router: router)
        let viewController = PasswordResetViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
