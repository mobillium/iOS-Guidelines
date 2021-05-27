//
//  LoginViewModel.swift
//  SampleProject
//
//  Created by Alihan Aktay on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol LoginViewDataSource {}

protocol LoginViewEventSource {
    var didGetError: StringClosure? { get set }
}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {
    func showRegisterOnWindow()
    func sendLoginRequest(username: String, password: String)
}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    var didGetError: StringClosure?
    
    func showRegisterOnWindow() {
        router.placeOnRegister()
    }
    
    func sendLoginRequest(username: String, password: String) {
        dataProvider.request(for: LoginRequest(username: username, password: password)) { [weak self] result in
            switch result {
            case .success(let response):
                // TO DO: Root to Main Page
                break
            case .failure(let error):
                self?.didGetError?(error.localizedDescription)
            }
        }
    }
}
