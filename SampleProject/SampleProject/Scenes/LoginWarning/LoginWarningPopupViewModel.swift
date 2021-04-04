//
//  LoginWarningPopupViewModel.swift
//  SampleProject
//
//  Created by emirhan Acısu on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol LoginWarningPopupViewDataSource {}

protocol LoginWarningPopupViewEventSource {}

protocol LoginWarningPopupViewProtocol: LoginWarningPopupViewDataSource, LoginWarningPopupViewEventSource {}

final class LoginWarningPopupViewModel: BaseViewModel<LoginWarningPopupRouter>, LoginWarningPopupViewProtocol {
    
}
