//
//  LoginSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 9.04.2026.
//

import Foundation
import Combine
import DataProvider

@MainActor
class LoginSceneModel: BaseSceneModel {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var emailError: String? = nil
    @Published var passwordError: String? = nil

    var onLoginSuccess: (() -> Void)?

    private let authRepository = AuthRepository(dataProvider: apiDataProvider)

    override init() {
        super.init()
    }

    func validateEmail() {
        if email.isEmpty {
            emailError = "E-posta alanı boş olamaz."
        } else if !isValidEmail(email) {
            emailError = "Geçerli bir e-posta adresi giriniz."
        } else {
            emailError = nil
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

    func login() {
        validateEmail()
        validatePassword()

        if emailError == nil && passwordError == nil {
            Task {
                await loginRequest()
            }
        }
    }

    private func loginRequest() async {
        showLoading = true
        let result = await authRepository.login(username: email, password: password)
        showLoading = false

        switch result {
        case .success(let auth):
            TokenStorage.save(token: auth.token)
            onLoginSuccess?()
        case .failure:
            passwordError = "Hatalı şifre"
        }
    }
}

