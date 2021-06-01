//
//  LoginWarningPopupViewController.swift
//  SampleProject
//
//  Created by emirhan Acısu on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

final class LoginWarningPopupViewController: BaseViewController<LoginWarningPopupViewModel> {
    
    private let contentView = UIViewBuilder()
        .backgroundColor(.appWhite)
        .cornerRadius(4)
        .masksToBounds(true)
        .clipsToBounds(true)
        .build()
    
    private let descriptionLabel = UILabelBuilder()
        .text(L10n.Componenets.Action.loginWarning)
        .textAlignment(.center)
        .textColor(.appCinder)
        .font(.font(.nunitoSemiBold, size: .large))
        .build()
    
    private let imageView = UIImageViewBuilder()
        .image(.icWarning)
        .contentMode(.scaleAspectFit)
        .masksToBounds(true)
        .clipsToBounds(true)
        .build()
    
    private let buttonStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .alignment(.fill)
        .distribution(.fillEqually)
        .build()
    
    private let loginButton = UIButtonBuilder()
        .backgroundColor(.appRed)
        .title(L10n.General.login)
        .titleColor(.appWhite)
        .titleFont(.font(.nunitoBold, size: .medium))
        .build()
    
    private let giveUpButton = UIButtonBuilder()
        .backgroundColor(.appZircon)
        .title(L10n.General.giveUp)
        .titleColor(.appCinder)
        .titleFont(.font(.nunitoBold, size: .medium))
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }
    
    func setupViews() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.40)
        view.addSubview(contentView)
        
        contentView.addSubview(imageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(giveUpButton)
        buttonStackView.addArrangedSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(touchUpInside(_:)), for: .touchUpInside)
        giveUpButton.addTarget(self, action: #selector(touchUpInside(_:)), for: .touchUpInside)
    }
    
    func setupLayouts() {
        contentView.centerYToSuperview()
        contentView.leadingToSuperview().constant = 25
        contentView.trailingToSuperview().constant = -25
        
        imageView.centerXToSuperview()
        imageView.topToSuperview().constant = 20
        imageView.size(CGSize(width: 60, height: 60))
        
        descriptionLabel.topToBottom(of: imageView).constant = 16
        descriptionLabel.edgesToSuperview(excluding: [.top, .bottom])
        loginButton.height(50)
        giveUpButton.height(50)
        
        buttonStackView.edgesToSuperview(excluding: .top)
        buttonStackView.topToBottom(of: descriptionLabel).constant = 15
    }
}

// MARK: - Actions
extension LoginWarningPopupViewController {
    
    @IBAction private func touchUpInside(_ sender: UIButton) {
        switch sender {
        case loginButton:
            viewModel.loginButtonAction()
        case giveUpButton:
            viewModel.giveUpButtonAction()
        default:
            break
        }
    }
}
