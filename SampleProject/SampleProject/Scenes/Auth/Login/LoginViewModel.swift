//
//  LoginViewModel.swift
//  SampleProject
//
//  Created by Alihan Aktay on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation
import KeychainSwift
import MobilliumUserDefaults

protocol LoginViewDataSource {}

protocol LoginViewEventSource {}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {
    func showRegisterOnWindow()
    func sendLoginRequest(username: String, password: String)
    func dismissLoginScene()
    func pushPasswordResetScene()
}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    
}

// MARK: - Actions
extension LoginViewModel {
    
    func showRegisterOnWindow() {
        router.pushRegister()
    }
    
    func dismissLoginScene() {
        router.close()
    }
    
    func pushPasswordResetScene() {
        router.pushPasswordReset()
    }
}

// MARK: - Network
extension LoginViewModel {
    
    func sendLoginRequest(username: String, password: String) {
        showLoading?()
        dataProvider.request(for: LoginRequest(username: username, password: password)) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                let keychain = KeychainSwift()
                keychain.set(response.token, forKey: Keychain.token)
                DefaultsKey.userId.value = response.user.id
                self.router.close()
            case .failure(let error):
                self.showWarningToast?("\(error.localizedDescription) \(L10n.Error.checkInformations)")
            }
        }
    }
}
