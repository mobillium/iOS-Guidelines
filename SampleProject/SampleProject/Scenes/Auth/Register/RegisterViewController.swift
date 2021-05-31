//
//  RegisterViewController.swift
//  SampleProject
//
//  Created by Alihan Aktay on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

final class RegisterViewController: BaseViewController<RegisterViewModel> {
    
    private let titleLabel = UILabelBuilder()
        .text(L10n.Modules.RegisterViewController.title)
        .textColor(.appCinder)
        .font(.font(.nunitoBold, size: .xxLarge))
        .build()
    
    private let stackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(15)
        .build()
    
    private let bottomStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(4)
        .build()
    
    private let bottomLabel = UILabelBuilder()
        .text(L10n.Modules.RegisterViewController.bottomText)
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appRaven)
        .build()
    
    private let loginButton = UIButtonBuilder()
        .titleColor(.appRed)
        .titleFont(.font(.nunitoBold, size: .xLarge))
        .title(L10n.General.login, for: .normal)
        .build()
    
    private let usernameTextField = FloatLabelTextField()
    private let emailTextField = FloatLabelTextField()
    private let passwordTextField = FloatLabelTextField()
    private let ctaButton = ButtonFactory.createPrimaryButton(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUIElements()
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        bottomStackView.addArrangedSubview(bottomLabel)
        bottomStackView.addArrangedSubview(loginButton)
        titleLabel.topToSuperview(usingSafeArea: true).constant = 50
        titleLabel.centerXToSuperview()
        titleLabel.bottomToTop(of: stackView).constant = -50
        stackView.leadingToSuperview().constant = 15
        stackView.trailingToSuperview().constant = -15
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(ctaButton)
        bottomStackView.bottomToSuperview(usingSafeArea: true)
        bottomStackView.leadingToSuperview(relation: .equalOrGreater).constant = 20
        bottomStackView.trailingToSuperview(relation: .equalOrLess).constant = -20
        bottomStackView.centerXToSuperview()
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        ctaButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    private func setUIElements() {
        usernameTextField.title = L10n.Placeholder.username
        usernameTextField.leftImage = .icUser
        emailTextField.title = L10n.Placeholder.email
        emailTextField.leftImage = .icMail
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress
        passwordTextField.title = L10n.Placeholder.password
        passwordTextField.leftImage = .icPassword
        passwordTextField.isSecureTextEntry = true
        ctaButton.setTitle(L10n.General.register, for: .normal)
    }
    
    // MARK: - Actions
    @objc
    private func loginButtonTapped() {
        viewModel.showLoginScreen()
    }
    
    @objc
    private func registerButtonTapped() {
        view.endEditing(true)
        guard let userName = usernameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text else {
            showWarningToast(message: L10n.Error.emptyFields)
            return
        }
        let validation = Validation()
        guard validation.isValidEmail(email) else { return }
        guard validation.isValidPassword(password) else { return }
        
        viewModel.sendRegisterRequest(username: userName, email: email, password: password)
    }
}
