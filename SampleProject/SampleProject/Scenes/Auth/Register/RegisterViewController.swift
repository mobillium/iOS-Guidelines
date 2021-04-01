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
    
    private var usernameTextField = FloatLabelTextField()
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
        titleLabel.topToSuperview().constant = 50
        titleLabel.centerXToSuperview()
        titleLabel.bottomToTop(of: stackView).constant = -50
        stackView.leadingToSuperview().constant = 15
        stackView.trailingToSuperview().constant = -15
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(ctaButton)
    }
    
    private func setUIElements() {
        usernameTextField.title = "Kullanıcı Adı"
        emailTextField.title = "E-mail Adresi"
        passwordTextField.title = "Şifre"
        ctaButton.setTitle("Üye Ol", for: .normal)
    }
    
}
