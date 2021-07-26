//
//  LoginWarningPopupViewModel.swift
//  SampleProject
//
//  Created by emirhan Acısu on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol LoginWarningPopupViewDataSource {}

protocol LoginWarningPopupViewEventSource {
    var loginHandler: VoidClosure? { get set }
}

protocol LoginWarningPopupViewProtocol: LoginWarningPopupViewDataSource, LoginWarningPopupViewEventSource {
    func giveUpButtonAction()
    func loginButtonAction()
}

final class LoginWarningPopupViewModel: BaseViewModel<LoginWarningPopupRouter>, LoginWarningPopupViewProtocol {
        
    var loginHandler: VoidClosure?
    
    func giveUpButtonAction() {
        router.close()
    }
    func loginButtonAction() {
        router.close()
        loginHandler?()
    }
    
}
