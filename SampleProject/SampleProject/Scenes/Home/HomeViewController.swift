//
//  HomeViewController.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit
import StoreKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let emailTextField = FloatLabelTextField()
    private let passwordTextField = FloatLabelTextField()
    private let loginButton = ButtonFactory.createPrimaryButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
    }
    
    private func configureContents() {
        navigationItem.title = "Home"
        view.addSubview(emailTextField)
        emailTextField.topToSuperview(usingSafeArea: true).constant = 20
        emailTextField.edgesToSuperview(excluding: [.bottom, .top], insets: .init(top: 20, left: 20, bottom: 20, right: 20))
        emailTextField.leftImage = .icMail
        emailTextField.title = "E-posta adresi"
        
        view.addSubview(passwordTextField)
        passwordTextField.topToBottom(of: emailTextField).constant = 20
        passwordTextField.edgesToSuperview(excluding: [.bottom, .top], insets: .init(top: 20, left: 20, bottom: 20, right: 20))
        passwordTextField.leftImage = .icPassword
        passwordTextField.title = "Şifre"
        
        view.addSubview(loginButton)
        loginButton.topToBottom(of: passwordTextField).constant = 20
        loginButton.edgesToSuperview(excluding: [.bottom, .top], insets: .init(top: 20, left: 20, bottom: 20, right: 20))
        loginButton.setTitle("Giriş Yap", for: .normal)
    }
    
}
