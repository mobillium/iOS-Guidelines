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
    
    private let categoryWithRecipeCellButton = ButtonFactory.createPrimaryButton(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        addButtons()
        addButtonTarget()
    }
    
    private func configureContents() {
        navigationItem.title = "Home"
        view.addSubview(scrollView)
        scrollView.topToSuperview(usingSafeArea: true)
        scrollView.edgesToSuperview(excluding: .top)
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
    }
    
    private func addButtons() {
        contentView.addSubview(categoryWithRecipeCellButton)
        categoryWithRecipeCellButton.edgesToSuperview(insets: .init(top: 20, left: 20, bottom: 20, right: 20))
        categoryWithRecipeCellButton.setTitle("CategoryWithRecipeCell", for: .normal)
    }
    
    private func addButtonTarget() {
        categoryWithRecipeCellButton.addTarget(self, action: #selector(recipeCellButtonTapped), for: .touchUpInside)
    }
    
    @IBAction private func recipeCellButtonTapped() {
        viewModel.recipeCellButtonTapped()
    }
}
