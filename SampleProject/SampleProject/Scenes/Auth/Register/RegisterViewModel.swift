//
//  RegisterViewModel.swift
//  SampleProject
//
//  Created by Alihan Aktay on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {
    var didGetError: StringClosure? { get set }
}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {
    func showLoginScreen()
    func sendRegisterRequest(username: String, email: String, password: String)
}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
    
    var didGetError: StringClosure?
    
    func showLoginScreen() {
        router.placeLoginOnWindow()
    }
    
    func sendRegisterRequest(username: String, email: String, password: String) {
        showLoading?()
        dataProvider.request(for: RegisterRequest(username: username, email: email, password: password)) { [weak self] (result) in
            self?.hideLoading?()
            switch result {
            case .success(let response):
                break
            case .failure(let error):
                self?.didGetError?(error.localizedDescription)
            }
        }
    }
    
}
