//
//  LoginViewModel.swift
//  SampleProject
//
//  Created by Alihan Aktay on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol LoginViewDataSource {}

protocol LoginViewEventSource {}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {
    func showRegisterOnWindow()
}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    func showRegisterOnWindow() {
        router.placeOnRegister()
    }
    
}
