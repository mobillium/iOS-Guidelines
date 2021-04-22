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
    private var titleLabel: UILabel = {
        return UILabelBuilder()
            .text("Üye Ol")
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
            .text("Hesabın mı var?")
            .font(.font(.nunitoBold, size: .xLarge))
            .textColor(.appRaven)
            .build()
    }()
    
    private var loginButton: UIButton = {
        return UIButtonBuilder()
            .titleColor(.appRed)
            .titleFont(.font(.nunitoBold, size: .xLarge))
            .title("Giriş Yap", for: .normal)
            .build()
    }()
    
    private var usernameTextField = FloatLabelTextField()
    private var emailTextField = FloatLabelTextField()
    private var passwordTextField = FloatLabelTextField()
    private var ctaButton = ButtonFactory.createPrimaryButton(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUIElements()
        subscribeViewModel()
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
        usernameTextField.title = "Kullanıcı Adı"
        usernameTextField.leftImage = .icUser
        emailTextField.title = "E-mail Adresi"
        emailTextField.leftImage = .icMail
        passwordTextField.title = "Şifre"
        passwordTextField.leftImage = .icPassword
        ctaButton.setTitle("Üye Ol", for: .normal)
    }
    
    private func subscribeViewModel() {
        viewModel.didGetError = { [weak self] (message) in
            //TODO: - Show error
        }
    }
    
    // MARK: - Actions
    @objc
    private func loginButtonTapped() {
        viewModel.showLoginScreen()
    }
    
    @objc
    private func registerButtonTapped() {
        viewModel.sendRegisterRequest(username: usernameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)
    }
}
