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
            .text("Giriş Yap")
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
            .text("Hesabın mı yok?")
            .font(.font(.nunitoBold, size: .xLarge))
            .textColor(.appRaven)
            .build()
    }()
    
    private var registerButton: UIButton = {
        return UIButtonBuilder()
            .titleColor(.appRed)
            .titleFont(.font(.nunitoBold, size: .xLarge))
            .title("Giriş Yap", for: .normal)
            .build()
    }()
    
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
        titleLabel.topToSuperview(usingSafeArea: true).constant = 50
        titleLabel.centerXToSuperview()
        titleLabel.bottomToTop(of: stackView).constant = -50
        stackView.leadingToSuperview().constant = 15
        stackView.trailingToSuperview().constant = -15
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(ctaButton)
        bottomStackView.leadingToSuperview(relation: .equalOrGreater).constant = 20
        bottomStackView.trailingToSuperview(relation: .equalOrLess).constant = -20
        bottomStackView.bottomToSuperview(usingSafeArea: true)
        bottomStackView.centerXToSuperview()
        bottomStackView.addArrangedSubview(bottomLabel)
        bottomStackView.addArrangedSubview(registerButton)
        registerButton.addTarget(self, action: #selector(regiserButtonTapped), for: .touchUpInside)
    }
    
    private func setUIElements() {
        emailTextField.title = "E-mail Adresi"
        passwordTextField.title = "Şifre"
        ctaButton.setTitle("Üye Ol", for: .normal)
    }
    
    // MARK: - Action
    @objc
    func regiserButtonTapped() {
        viewModel.showRegisterOnWindow()
    }
    
}
