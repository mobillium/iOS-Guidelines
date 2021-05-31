//
//  LoginViewController.swift
//  SampleProject
//
//  Created by Alihan Aktay on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

final class LoginViewController: BaseViewController<LoginViewModel> {
    private var titleLabel: UILabel = {
        return UILabelBuilder()
            .text(L10n.Modules.LoginViewController.title)
            .textColor(.appCinder)
            .font(.font(.nunitoBold, size: .xxLarge))
            .build()
    }()
    
    private var stackView: UIStackView = {
        return UIStackViewBuilder()
            .axis(.vertical)
            .spacing(15)
            .build()
    }()
    
    private var bottomStackView: UIStackView = {
        return UIStackViewBuilder()
            .axis(.horizontal)
            .spacing(4)
            .build()
    }()
    
    private var bottomLabel: UILabel = {
        return UILabelBuilder()
            .text(L10n.Modules.LoginViewController.bottomText)
            .font(.font(.nunitoBold, size: .xLarge))
            .textColor(.appRaven)
            .build()
    }()
    
    private var registerButton: UIButton = {
        return UIButtonBuilder()
            .titleColor(.appRed)
            .titleFont(.font(.nunitoBold, size: .xLarge))
            .title(L10n.General.register, for: .normal)
            .build()
    }()
    
    private let forgotPasswordButton = UIButtonBuilder()
        .titleFont(.font(.nunitoSemiBold, size: .large))
        .titleColor(.appRaven)
        .build()
    
    private var emailTextField = FloatLabelTextField()
    private var passwordTextField = FloatLabelTextField()
    private var ctaButton = ButtonFactory.createPrimaryButton(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUIElements()
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        view.addSubview(forgotPasswordButton)
        titleLabel.topToSuperview(usingSafeArea: true).constant = 50
        titleLabel.centerXToSuperview()
        titleLabel.bottomToTop(of: stackView).constant = -50
        stackView.leadingToSuperview().constant = 15
        stackView.trailingToSuperview().constant = -15
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(ctaButton)
        forgotPasswordButton.topToBottom(of: stackView).constant = 10
        forgotPasswordButton.trailingToSuperview().constant = -15
        forgotPasswordButton.height(20)
        bottomStackView.leadingToSuperview(relation: .equalOrGreater).constant = 20
        bottomStackView.trailingToSuperview(relation: .equalOrLess).constant = -20
        bottomStackView.bottomToSuperview(usingSafeArea: true)
        bottomStackView.centerXToSuperview()
        bottomStackView.addArrangedSubview(bottomLabel)
        bottomStackView.addArrangedSubview(registerButton)
        registerButton.addTarget(self, action: #selector(regiserButtonTapped), for: .touchUpInside)
        ctaButton.addTarget(self, action: #selector(ctaButtonTapped), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    }
    
    private func setUIElements() {
        emailTextField.title = L10n.Placeholder.email
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress
        passwordTextField.title = L10n.Placeholder.password
        passwordTextField.isSecureTextEntry = true
        ctaButton.setTitle(L10n.General.login, for: .normal)
        forgotPasswordButton.setTitle(L10n.Modules.LoginViewController.forgotPassword, for: .normal)
    }

    // MARK: - Action
    @objc
    func regiserButtonTapped() {
        viewModel.showRegisterOnWindow()
    }
    
    @objc
    func ctaButtonTapped() {
        view.endEditing(true)
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {
            showWarningToast(message: L10n.Error.emptyFields)
            return
        }
        let validation = Validation()
        guard validation.isValidPassword(password) else { return }
        
        viewModel.sendLoginRequest(username: email, password: password)
    }
    
    @objc
    func forgotPasswordButtonTapped() {
        
    }
}
