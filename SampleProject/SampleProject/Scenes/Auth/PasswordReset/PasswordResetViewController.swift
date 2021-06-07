//
//  PasswordResetViewController.swift
//  SampleProject
//
//  Created by Murat Celebi on 31.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

final class PasswordResetViewController: BaseViewController<PasswordResetViewModel> {
    
    private let titleLabel = UILabelBuilder()
        .textColor(.appCinder)
        .font(.font(.nunitoBold, size: .xxLarge))
        .build()
    
    private let stackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(15)
        .build()
    private var emailTextField = FloatLabelTextField()
    private var resetButton = ButtonFactory.createPrimaryButton(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setLocalize()
    }
}

// MARK: - UILayout
extension PasswordResetViewController {
    
    private func addSubViews() {
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        titleLabel.topToSuperview(usingSafeArea: true).constant = 50
        titleLabel.centerXToSuperview()
        stackView.topToBottom(of: titleLabel).constant = 50
        stackView.leadingToSuperview().constant = 15
        stackView.trailingToSuperview().constant = -15
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Configure and Localize
extension PasswordResetViewController {
    
    private func configureContents() {
        emailTextField.leftImage = .icMail
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress
    }
    
    private func setLocalize() {
        titleLabel.text = L10n.Modules.PasswordResetController.title
        emailTextField.title = L10n.Placeholder.email
        resetButton.setTitle(L10n.Modules.PasswordResetController.reset, for: .normal)
    }
}

// MARK: - Actions
extension PasswordResetViewController {
    
    @objc
    private func resetButtonTapped() {
        guard let email = emailTextField.text, !email.isEmpty else {
            showWarningToast(message: L10n.Error.empty(L10n.Error.Key.email))
            return
        }
        let validation = Validation()
        guard validation.isValidEmail(email) else { return }
        
        viewModel.passwordReset(email: email)
    }
}
