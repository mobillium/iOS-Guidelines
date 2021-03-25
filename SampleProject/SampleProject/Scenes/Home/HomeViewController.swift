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
    
    private let scrollView = UIScrollView()
    private let contentView = UIViewBuilder()
        .backgroundColor(.clear)
        .build()
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
    
    private let countStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(0)
        .distribution(.fillEqually)
        .build()
    
    private let commentCountInfoView = CountInfoView()
    private let likeCountInfoView = CountInfoView()
    private let recipeStepsView = RecipeDetailInfoView()
    private let recipeIngredientsView = RecipeDetailInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        addTextFields()
        addButtons()
        addDetailInfoViews()
    }
    
    private func configureContents() {
        navigationItem.title = "Home"
        view.addSubview(scrollView)
        scrollView.topToSuperview(usingSafeArea: true)
        scrollView.edgesToSuperview(excluding: .top)
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
        
        contentView.addSubview(segmentedControl)
        segmentedControl.topToSuperview(usingSafeArea: true)
        segmentedControl.edgesToSuperview(excluding: [.bottom, .top])
        segmentedControl.height(44)
        
        contentView.addSubview(countStackView)
        countStackView.topToBottom(of: segmentedControl)
        countStackView.edgesToSuperview(excluding: [.bottom, .top])
        countStackView.addArrangedSubview(commentCountInfoView)
        countStackView.addArrangedSubview(likeCountInfoView)
        commentCountInfoView.isUserInteractionEnabled = false
        commentCountInfoView.icon = UIImage.icComment.withRenderingMode(.alwaysTemplate)
        commentCountInfoView.isSelected = false
        commentCountInfoView.count = 10
        commentCountInfoView.info = L10n.General.comment
        likeCountInfoView.icon = UIImage.icHeart.withRenderingMode(.alwaysTemplate)
        likeCountInfoView.isSelected = true
        likeCountInfoView.count = 3323
        likeCountInfoView.info = L10n.General.like
    }
    
    private func addTextFields() {
        contentView.addSubview(emailTextField)
        emailTextField.topToBottom(of: commentCountInfoView).constant = 20
        emailTextField.edgesToSuperview(excluding: [.bottom, .top], insets: .init(top: 20, left: 20, bottom: 20, right: 20))
        emailTextField.leftImage = .icMail
        emailTextField.title = "E-posta adresi"
        
        contentView.addSubview(passwordTextField)
        passwordTextField.topToBottom(of: emailTextField).constant = 20
        passwordTextField.edgesToSuperview(excluding: [.bottom, .top], insets: .init(top: 20, left: 20, bottom: 20, right: 20))
        passwordTextField.leftImage = .icPassword
        passwordTextField.title = "Şifre"
    }
    
    private func addButtons() {
        contentView.addSubview(loginButton)
        loginButton.topToBottom(of: passwordTextField).constant = 20
        loginButton.edgesToSuperview(excluding: [.bottom, .top], insets: .init(top: 20, left: 20, bottom: 20, right: 20))
        loginButton.setTitle("Giriş Yap", for: .normal)
        
        contentView.addSubview(loginBorderedButton)
        loginBorderedButton.topToBottom(of: loginButton).constant = 20
        loginBorderedButton.edgesToSuperview(excluding: [.bottom, .top], insets: .init(top: 20, left: 20, bottom: 20, right: 20))
        loginBorderedButton.setTitle("Giriş Yap", for: .normal)
    }
    
    private func addDetailInfoViews() {
        contentView.addSubview(recipeIngredientsView)
        recipeIngredientsView.topToBottom(of: loginBorderedButton).constant = 20
        recipeIngredientsView.edgesToSuperview(excluding: [.bottom, .top])
        recipeIngredientsView.title = "Malzemeler"
        recipeIngredientsView.info = "8 su bardağı su\n1 silme yemek kaşığı tuz" +
            "\n250 gram makarna(yarım paket)" +
            "\n 3 yemek kaşığı sıvı yağ" +
            "\nMakarna süzgeci"
        recipeIngredientsView.icon = UIImage.icRestaurant.withRenderingMode(.alwaysTemplate)
        recipeIngredientsView.iconSubtitle = "4-6"
        
        contentView.addSubview(recipeStepsView)
        recipeStepsView.bottomToSuperview().constant = -20
        recipeStepsView.topToBottom(of: recipeIngredientsView).constant = 20
        recipeStepsView.edgesToSuperview(excluding: [.bottom, .top])
        recipeStepsView.title = "Yapılışı"
        recipeStepsView.info = "Öncelikle tencereye 8 bardak soğuk suyu ekleyin." +
            "\nKaynayan suyun içerisine tuzu ve sıvı" +
            "\nyağı ekleyerek kaynaya kadar kapağı" +
            "\nkapalı bir şekilde bekleyin." +
            "\n\n~Afiyet olsun…"
        recipeStepsView.icon = UIImage.icClock.withRenderingMode(.alwaysTemplate)
        recipeStepsView.iconSubtitle = "20dk"
    }
}
