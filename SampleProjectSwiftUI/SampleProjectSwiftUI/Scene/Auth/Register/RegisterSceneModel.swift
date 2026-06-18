//
//  RegisterSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 18.06.2026.
//

import Foundation
import Combine
import DataProvider
import Utilities

@MainActor
class RegisterSceneModel: BaseSceneModel {

    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var emailError: String?
    @Published var usernameError: String?
    @Published var passwordError: String?

    private let authRepository = AuthRepository(dataProvider: apiDataProvider)

    override init() {
        super.init()
    }

    func validateEmail() {
        if email.isEmpty {
            emailError = "E-posta boş olamaz."
        } else if !isValidEmail(email) {
            emailError = "Geçerli bir e-posta adresi giriniz."
        } else {
            emailError = nil
        }
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

    func register() {
        validateEmail()
        validateUsername()
        validatePassword()

        if emailError == nil && !email.isEmpty &&
           usernameError == nil && !username.isEmpty &&
           passwordError == nil {
            Task {
                let _ = await registerRequest()
            }
        }
    }

    private func registerRequest() async -> Bool {
        showLoading = true
        let result = await authRepository.register(username: username, email: email, password: password)
        showLoading = false

        switch result {
        case .success(let auth):
            TokenStorage.save(token: auth.token)
            NotificationCenter.default.post(name: .loginSuccess, object: nil)
            NotificationCenter.default.post(name: .dismissAuth, object: nil)
            return true
        case .failure:
            passwordError = "Kayıt işlemi başarısız oldu."
            return false
        }
    }
}

