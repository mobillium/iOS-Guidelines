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
    func sendRegisterRequest(username: String, email: String, password: String)
}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
        
    func showLoginScreen() {
        router.close()
    }
    
    func sendRegisterRequest(username: String, email: String, password: String) {
        showLoading?()
        dataProvider.request(for: RegisterRequest(username: username, email: email, password: password)) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                print(response.token)
                self.router.close()
            case .failure(let error):
                self.showWarningToast?("\(error.localizedDescription) \(L10n.Error.checkInformations)")
            }
        }
    }
    
}
