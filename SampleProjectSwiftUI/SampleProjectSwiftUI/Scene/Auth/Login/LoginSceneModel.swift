//
//  LoginSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 9.04.2026.
//

import Foundation
import Combine
import DataProvider
import Utilities

@MainActor
class LoginSceneModel: BaseSceneModel {

    @Published var username: String = ""
    @Published var password: String = ""
    @Published var usernameError: String?
    @Published var passwordError: String?

    private let authRepository = AuthRepository(dataProvider: apiDataProvider)

    override init() {
        super.init()
    }

    func validateUsername() {
        if username.isEmpty {
            usernameError = "Kullanıcı adı boş olamaz."
        } else if username.count < 3 {
            usernameError = "Kullanıcı adı en az 3 karakter olmalıdır."
        } else {
            usernameError = nil
        }
    }

    func validatePassword() {
        if password.isEmpty {
            passwordError = "Şifre alanı boş olamaz."
        } else if password.count < 6 {
            passwordError = "Şifre en az 6 karakter olmalıdır."
        } else {
            passwordError = nil
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }

    func login(successCompletion: VoidClosure?) {
        validateUsername()
        validatePassword()

        if usernameError == nil && !username.isEmpty && passwordError == nil {
            Task {
                let isSuccess = await loginRequest()
                if isSuccess {
                    successCompletion?()
                }
            }
        }
    }

    private func loginRequest() async -> Bool {
        showLoading = true
        let result = await authRepository.login(username: username, password: password)
        showLoading = false

        switch result {
        case .success(let auth):
            TokenStorage.save(token: auth.token)
            NotificationCenter.default.post(name: .loginSuccess, object: nil)
            return true
        case .failure:
            passwordError = "Hatalı şifre"
            return false
        }
    }
}
