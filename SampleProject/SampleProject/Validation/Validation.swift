//
//  Validation.swift
//  SampleProject
//
//  Created by Murat Celebi on 31.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

class Validation {
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        guard emailPred.evaluate(with: email) else {
            ToastPresenter.showWarningToast(text: "Lütfen geçerli bir email adresi giriniz.")
            return false
        }
        return true
    }
    
    func isValidPassword(_ password: String) -> Bool {
        guard password.count > 5 else {
            ToastPresenter.showWarningToast(text: "Şifreniz en az 6 karaterden oluşmalıdır.")
            return false
        }
        return true
    }
    
}
