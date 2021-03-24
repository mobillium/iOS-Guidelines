//
//  HomeViewController.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit
import StoreKit
import Segmentio

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let emailTextField = FloatLabelTextField()
    private let passwordTextField = FloatLabelTextField()
    private let loginButton = ButtonFactory.createPrimaryButton(style: .large)
    private let loginBorderedButton = ButtonFactory.createPrimaryBorderedButton(style: .small)
    private let segmentedControl: Segmentio = {
        let segmentedControl = Segmentio()
        segmentedControl.selectedSegmentioIndex = 0
        var content = [SegmentioItem]()
        let firstSegment = SegmentioItem(title: "EDİTÖR SEÇİMİ", image: nil)
        let secondSegment = SegmentioItem(title: "SON EKLENENLER", image: nil)
        content.append(contentsOf: [firstSegment, secondSegment])
        let options = SegmentioOptions.options()
        segmentedControl.setup(content: content, style: .onlyLabel, options: options)
        return segmentedControl
    }()
    
    private let recipeCellButton = ButtonFactory.createPrimaryButton(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        addButtonTarget()
    }
    
    private func configureContents() {
        navigationItem.title = "Home"
        
        view.addSubview(segmentedControl)
        segmentedControl.topToSuperview(usingSafeArea: true)
        segmentedControl.edgesToSuperview(excluding: [.bottom, .top])
        segmentedControl.height(44)
        
        view.addSubview(emailTextField)
        emailTextField.topToBottom(of: segmentedControl).constant = 20
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
        
        view.addSubview(loginBorderedButton)
        loginBorderedButton.topToBottom(of: loginButton).constant = 20
        loginBorderedButton.edgesToSuperview(excluding: [.bottom, .top], insets: .init(top: 20, left: 20, bottom: 20, right: 20))
        loginBorderedButton.setTitle("Giriş Yap", for: .normal)
        
        view.addSubview(recipeCellButton)
        recipeCellButton.topToBottom(of: loginBorderedButton).constant = 20
        recipeCellButton.edgesToSuperview(excluding: [.bottom, .top], insets: .init(top: 20, left: 20, bottom: 20, right: 20))
        recipeCellButton.setTitle("RecipeCell", for: .normal)
    }
    
    private func addButtonTarget() {
        recipeCellButton.addTarget(self, action: #selector(recipeCellButtonTapped), for: .touchUpInside)
    }
    
    @IBAction private func recipeCellButtonTapped() {
        viewModel.recipeCellButtonTapped()
    }
}
