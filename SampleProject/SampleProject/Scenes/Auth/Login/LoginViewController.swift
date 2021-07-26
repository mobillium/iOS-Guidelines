//
//  LoginViewController.swift
//  SampleProject
//
//  Created by Alihan Aktay on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

final class LoginViewController: BaseViewController<LoginViewModel> {
    
    private let titleLabel = UILabelBuilder()
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
            .font(.font(.nunitoBold, size: .xLarge))
            .textColor(.appRaven)
            .build()
    
    private let registerButton = UIButtonBuilder()
            .titleColor(.appRed)
            .titleFont(.font(.nunitoBold, size: .xLarge))
            .build()
    
    private let forgotPasswordButton = UIButtonBuilder()
        .titleFont(.font(.nunitoSemiBold, size: .large))
        .titleColor(.appRaven)
        .build()
    
    private let usernameTextField = FloatLabelTextField()
    private let passwordTextField = FloatLabelTextField()
    private let ctaButton = ButtonFactory.createPrimaryButton(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        setLocalize()
    }
}

// MARK: - UILayout
extension LoginViewController {
    
    private func addSubViews() {
        addTitleLabel()
        addStackView()
        addBottomStackView()
        addForgotPasswordButton()    
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topToSuperview(usingSafeArea: true).constant = 50
        titleLabel.centerXToSuperview()
    }
    
    private func addStackView() {
        view.addSubview(stackView)
        stackView.topToBottom(of: titleLabel).constant = 50
        stackView.leadingToSuperview().constant = 15
        stackView.trailingToSuperview().constant = -15
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(ctaButton)
        registerButton.addTarget(self, action: #selector(regiserButtonTapped), for: .touchUpInside)
        ctaButton.addTarget(self, action: #selector(ctaButtonTapped), for: .touchUpInside)
    }
    
    private func addBottomStackView() {
        view.addSubview(bottomStackView)
        bottomStackView.leadingToSuperview(relation: .equalOrGreater).constant = 20
        bottomStackView.trailingToSuperview(relation: .equalOrLess).constant = -20
        bottomStackView.bottomToSuperview(usingSafeArea: true)
        bottomStackView.centerXToSuperview()
        bottomStackView.addArrangedSubview(bottomLabel)
        bottomStackView.addArrangedSubview(registerButton)
    }
    
    private func addForgotPasswordButton() {
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.topToBottom(of: stackView).constant = 10
        forgotPasswordButton.trailingToSuperview().constant = -15
        forgotPasswordButton.height(20)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Configure and Localize
extension LoginViewController {
    
    private func configureContents() {
        usernameTextField.autocapitalizationType = .none
        usernameTextField.leftImage = .icUser
        passwordTextField.leftImage = .icPassword
        passwordTextField.isSecureTextEntry = true
        configureCancelRightBarButton()
    }
    
    private func setLocalize() {
        titleLabel.text = L10n.Modules.LoginViewController.title
        usernameTextField.title = L10n.Placeholder.username
        passwordTextField.title = L10n.Placeholder.password
        ctaButton.setTitle(L10n.General.login, for: .normal)
        forgotPasswordButton.setTitle(L10n.Modules.LoginViewController.forgotPassword, for: .normal)
        registerButton.setTitle(L10n.General.register, for: .normal)
        bottomLabel.text = L10n.Modules.LoginViewController.bottomText
    }

    private func configureCancelRightBarButton() {
        let image = UIImage.icClose.withRenderingMode(.alwaysTemplate)
        let cancelBarButton = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(dismissLoginViewController))
        cancelBarButton.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = cancelBarButton
    }
}

// MARK: - Actions
extension LoginViewController {
    
    @objc
    private func regiserButtonTapped() {
        viewModel.showRegisterOnWindow()
    }
    
    @objc
    private func ctaButtonTapped() {
        view.endEditing(true)
        guard let userName = usernameTextField.text,
              let password = passwordTextField.text else {
            showWarningToast(message: L10n.Error.emptyFields)
            return
        }
        let validation = Validation()
        guard validation.isValidPassword(password) else { return }
        
        viewModel.sendLoginRequest(username: userName, password: password)
    }
    
    @objc
    private func forgotPasswordButtonTapped() {
        viewModel.pushPasswordResetScene()
    }
    
    @objc
    private func dismissLoginViewController() {
        viewModel.dismissLoginScene()
    }
}
