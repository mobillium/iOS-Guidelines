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
        .font(.font(.nunitoSemiBold, size: .large))
        .build()
    
    private let imageView = UIImageViewBuilder()
        .image(.icWarning)
        .contentMode(.scaleAspectFit)
        .tintColor(.yellow)  // Color eklenebilir
        .build()
    
    private let buttonStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .alignment(.fill)
        .distribution(.fillEqually)
        .build()
    
    private let loginButton = UIButtonBuilder()
        .backgroundColor(.red)
        .title("Giriş Yap")
        .titleColor(.appWhite)
        .titleFont(.font(.nunitoBold, size: .medium))
        .build()
    
    private let giveUpButton = UIButtonBuilder()
        .backgroundColor(.red)
        .title("Vazgeç")
        .titleColor(.black)
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
        buttonStackView.addArrangedSubview(loginButton)
        buttonStackView.addArrangedSubview(giveUpButton)
    }
    
    func setupLayouts() {
        contentView.centerInSuperview()
        contentView.height(180)
        contentView.width(325)
        
        imageView.centerX(to: contentView)
        imageView.topToSuperview().constant = 20
        imageView.bottomToTop(of: descriptionLabel).constant = -16
        imageView.height(60)
        imageView.width(60)
        
        descriptionLabel.topToBottom(of: imageView).constant = 16
        descriptionLabel.edgesToSuperview(excluding: [.top, .bottom])
        descriptionLabel.bottomToTop(of: buttonStackView).constant = -15
        
        buttonStackView.edgesToSuperview(excluding: .top)
        buttonStackView.topToBottom(of: descriptionLabel).constant = 15
    }
    
}
