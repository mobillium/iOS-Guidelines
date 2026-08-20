//
//  ForgotPasswordSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Ahmet İmirze on 20.08.2026.
//

import Combine
import Foundation

@MainActor
class ForgotPasswordSceneModel: BaseSceneModel {

	@Published var email = ""
	@Published var emailError: String?

	func validateEmail() -> Bool {
		if email.isEmpty {
			emailError = "E-posta boş olamaz."
            return false
		} else if !isValidEmail(email) {
			emailError = "Geçerli bir e-posta adresi giriniz."
            return false
		} else {
			emailError = nil
            return true
		}
	}

	private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
		return emailTest.evaluate(with: email)
	}
}
