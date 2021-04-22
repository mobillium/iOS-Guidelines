//
//  RegisterViewModel.swift
//  SampleProject
//
//  Created by Alihan Aktay on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {
    func showLoginScreen()
}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
    func showLoginScreen() {
        router.placeLoginOnWindow()
    }
    
}
