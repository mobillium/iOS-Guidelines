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
    
    private let userView = UserView(userViewType: .withFollowButton)
    private let ingredientsView = RecipeDetailInfoView()
    private let stepsView = RecipeDetailInfoView()
    
    private let commentsContainerView = UIViewBuilder()
        .backgroundColor(.appWhite)
        .build()
    private let commentsTitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appCinder)
        .text(L10n.General.comments)
        .build()
    private let commentsSeparator = UIViewBuilder()
        .backgroundColor(.appZircon)
        .build()
    private let commentsCollectionView = UICollectionViewBuilder<DynamicHeightCollectionView>()
        .scrollDirection(.vertical)
        .registerCell(CommentCell.self, reuseIdentifier: CommentCell.defaultReuseIdentifier)
        .showsVerticalScrollIndicator(false)
        .bounces(false)
        .build()
    
    private let commentButtonContainerView = UIViewBuilder()
        .backgroundColor(.clear)
        .build()
    private let commentButton = ButtonFactory.createPrimaryButton(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        setLocalize()
        fillData()
        subscribeViewModel()
        configureCollectionView()
        viewModel.getRecipeComment(2)
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
        
        contentStackView.addArrangedSubview(userView)
        contentStackView.addArrangedSubview(ingredientsView)
        contentStackView.addArrangedSubview(stepsView)
        contentStackView.addArrangedSubview(commentsContainerView)
        contentStackView.addArrangedSubview(commentButtonContainerView)
        
        commentsContainerView.addSubview(commentsTitleLabel)
        commentsContainerView.addSubview(commentsSeparator)
        commentsContainerView.addSubview(commentsCollectionView)
        
        commentsTitleLabel.edgesToSuperview(excluding: .bottom, insets: .init(top: 11, left: 15, bottom: 11, right: 15))
        
        commentsSeparator.height(1)
        commentsSeparator.edgesToSuperview(excluding: [.top, .bottom])
        commentsSeparator.topToBottom(of: commentsTitleLabel).constant = 11
        
        commentsCollectionView.edgesToSuperview(excluding: .top)
        commentsCollectionView.topToBottom(of: commentsSeparator)
    }
    
    private func setLocalize() {
        ingredientsView.title = L10n.General.recipeIngredients
        ingredientsView.icon = .icRestaurant
        stepsView.title = L10n.General.recipeSteps
        stepsView.icon = .icClock
        commentButton.setTitle(L10n.General.addComment, for: .normal)
    }
    
    private func fillData() {
        userView.username = viewModel.username
        userView.recipeAndFollowerCountText = viewModel.recipeAndFollowerCountText
        ingredientsView.iconSubtitle = viewModel.numberOfPeople
        ingredientsView.info = viewModel.ingredients
        stepsView.iconSubtitle = viewModel.time
        stepsView.info = viewModel.steps
        commentsCollectionView.reloadData()
        commentsCollectionView.layoutIfNeeded()
    }
    
    private func subscribeViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.commentsCollectionView.reloadData()
        }
    }
    
    private func configureCollectionView() {
        commentsCollectionView.dataSource = self
        commentsCollectionView.delegate = self
    }
}

// MARK: - UICollectionViewDataSource
extension RecipeDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CommentCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(with: cellItem)
        return cell
    }
    
}

// swiftlint:disable line_length
// MARK: - UICollectionViewDelegateFlowLayout
extension RecipeDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 195)
    }
    
}
// swiftlint:enable line_length

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
        viewModel.username = "aslanmsalih"
        viewModel.recipeAndFollowerCountText = "3 Tarif 0 Takipçi"
        
        let comment = CommentCellModel(userId: 0,
                                       imageUrl: nil,
                                       username: "salih",
                                       recipeAndFollowerCountText: "1 Tarif, 3 Takipçi",
                                       timeDifferenceText: "3 gün önce",
                                       commentId: 1,
                                       commentText: "Çok güzel bir tarif, çok teşekkürler")
        viewModel.cellItems.append(comment)
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
