//
//  RecipeDetailViewController.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit
import TinyConstraints

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
    
    private let countInfoStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(1)
        .distribution(.fillEqually)
        .build()
    private let commentCountView = CountInfoView()
    private let likeCountView = CountInfoView()
    
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
        viewModel.getRecipeDetail(26)
        configureContents()
        setLocalize()
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
        
        countInfoStackView.addArrangedSubview(commentCountView)
        countInfoStackView.addArrangedSubview(likeCountView)
        
        contentStackView.addArrangedSubview(countInfoStackView)
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
        commentCountView.icon = .icComment
        commentCountView.info = L10n.General.comment
        likeCountView.icon = .icHeart
        likeCountView.info = L10n.General.like
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
        view.layoutIfNeeded()
        commentsCollectionView.reloadData()
        commentsCollectionView.layoutIfNeeded()
    }
    
    private func subscribeViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.commentsCollectionView.reloadData()
        }
        viewModel.reloadDetailData = { [weak self] in
            self?.fillData()
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
