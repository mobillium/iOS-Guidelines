//
//  RecipeDetailViewController.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

final class RecipeDetailViewController: BaseViewController<RecipeDetailViewModel> {
    
    private let scrollView = UIScrollViewBuilder()
        .showsHorizontalScrollIndicator(false)
        .showsVerticalScrollIndicator(false)
        .alwaysBounceVertical(false)
        .build()
    
    private let contentStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(15)
        .build()
    
    private let ingredientsView = RecipeDetailInfoView()
    private let stepsView = RecipeDetailInfoView()
    private let commentButtonContainerView = UIViewBuilder()
        .backgroundColor(.clear)
        .build()
    private let commentButton = ButtonFactory.createPrimaryButton(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        setLocalize()
        fillData()
    }
    
    private func configureContents() {
        view.backgroundColor = .appSecondaryBackground
        
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(excluding: .top)
        scrollView.topToSuperview(usingSafeArea: true)
        
        scrollView.addSubview(contentStackView)
        contentStackView.widthToSuperview()
        contentStackView.edgesToSuperview()
        
        commentButtonContainerView.addSubview(commentButton)
        commentButton.edgesToSuperview(insets: .init(top: 0, left: 15, bottom: 15, right: 15))
        
        contentStackView.addArrangedSubview(ingredientsView)
        contentStackView.addArrangedSubview(stepsView)
        contentStackView.addArrangedSubview(commentButtonContainerView)
    }
    
    private func setLocalize() {
        ingredientsView.title = L10n.General.recipeIngredients
        ingredientsView.icon = .icRestaurant
        stepsView.title = L10n.General.recipeSteps
        stepsView.icon = .icClock
        commentButton.setTitle(L10n.General.addComment, for: .normal)
    }
    
    private func fillData() {
        ingredientsView.iconSubtitle = viewModel.numberOfPeople
        ingredientsView.info = viewModel.ingredients
        stepsView.iconSubtitle = viewModel.time
        stepsView.info = viewModel.steps
    }
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct RecipeDetailViewControllerRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let router = RecipeDetailRouter()
        let viewModel = RecipeDetailViewModel(router: router)
        viewModel.ingredients = "8 su bardağı su\n"
        + "1 silme yemek kaşığı tuz\n"
        + "250 gram makarna(yarım paket)\n"
        + "3 yemek kaşığı sıvı yağ\n"
        + "Makarna süzgeci"
        viewModel.steps = "Öncelikle tencereye 8 bardak soğuk suyu ekleyin. Kaynayan suyun içerisine tuzu ve sıvı\n"
        + "yağı ekleyerek kaynaya kadar kapağı kapalı bir şekilde bekleyin.\n\n"
        + "Afiyet olsun…"
        viewModel.time = "20dk"
        viewModel.numberOfPeople = "4-6"
        let viewController = RecipeDetailViewController(viewModel: viewModel)
        return viewController.view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        
    }
}

@available(iOS 13.0, *)
struct RecipeDetailController_Preview: PreviewProvider { // swiftlint:disable:this type_name
    static var previews: some View {
        RecipeDetailViewControllerRepresentable().previewLayout(.device)
    }
}
#endif
