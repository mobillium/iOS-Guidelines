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
    
    private let topTitleView = RecipeDetailTitlesView()
    
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
    
    private let commentsCollectionView: DynamicHeightCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let width = UIScreen.main.bounds.size.width
        layout.estimatedItemSize = CGSize(width: width, height: 10)
        let collectionView = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .appSecondaryBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CommentCell.self)
        return collectionView
    }()
    
    private let commentButtonContainerView = UIViewBuilder()
        .backgroundColor(.clear)
        .build()
    private let commentButton = ButtonFactory.createPrimaryButton(style: .large)
    
    private let recipeHeaderView = RecipeDetailHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setLocalize()
        subscribeViewModel()
        configureCollectionView()
        viewModel.getRecipeComment(2)
        viewModel.getRecipeDetail(26)
        subscribeActions()
    }
    
    private func subscribeViewModel() {
        viewModel.reloadCommentData = { [weak self] in
            self?.commentsCollectionView.reloadData()
        }
        
        viewModel.reloadDetailData = { [weak self] in
            self?.fillData()
        }
        
        viewModel.toggleIsLiked = { [weak self] in
            guard let self = self else { return }
            self.viewModel.isLiked.toggle()
            
            let isLiked = self.viewModel.isLiked
            if isLiked {
                self.likeCountView.iconColor = .appRed
                self.viewModel.likeCount? += 1
                self.likeCountView.count = self.viewModel.likeCount
            } else {
                self.likeCountView.iconColor = .appCinder
                self.viewModel.likeCount? -= 1
                self.likeCountView.count = self.viewModel.likeCount
            }
        }
        
        viewModel.toggleIsFollowing = { [weak self] in
            self?.userView.isFollowing.toggle()
        }
    }
}

// MARK: - UILayout
extension RecipeDetailViewController {
    
    private func addSubviews() {
        view.backgroundColor = .appSecondaryBackground
        addScrollView()
        addContentStackView()
        addCommentsContainerView()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(excluding: .top)
        scrollView.topToSuperview(usingSafeArea: true)
    }
    
    private func addContentStackView() {
        scrollView.addSubview(contentStackView)
        contentStackView.widthToSuperview()
        contentStackView.edgesToSuperview()
        
        contentStackView.addArrangedSubview(recipeHeaderView)
        contentStackView.setCustomSpacing(0, after: recipeHeaderView)
        contentStackView.addArrangedSubview(topTitleView)
        contentStackView.setCustomSpacing(1, after: topTitleView)
        contentStackView.addArrangedSubview(countInfoStackView)
        contentStackView.addArrangedSubview(userView)
        contentStackView.addArrangedSubview(ingredientsView)
        contentStackView.addArrangedSubview(stepsView)
        contentStackView.addArrangedSubview(commentsContainerView)
        contentStackView.addArrangedSubview(commentButtonContainerView)
        
        countInfoStackView.addArrangedSubview(commentCountView)
        countInfoStackView.addArrangedSubview(likeCountView)
        recipeHeaderView.aspectRatio(1)
    }
    
    private func addCommentsContainerView() {
        commentsContainerView.addSubview(commentsTitleLabel)
        commentsContainerView.addSubview(commentsSeparator)
        commentsContainerView.addSubview(commentsCollectionView)
        
        commentsTitleLabel.edgesToSuperview(excluding: .bottom, insets: .init(top: 11, left: 15, bottom: 11, right: 15))
        
        commentsSeparator.height(1)
        commentsSeparator.edgesToSuperview(excluding: [.top, .bottom])
        commentsSeparator.topToBottom(of: commentsTitleLabel).constant = 11
        
        commentsCollectionView.edgesToSuperview(excluding: .top)
        commentsCollectionView.topToBottom(of: commentsSeparator)
        
        commentButtonContainerView.addSubview(commentButton)
        commentButton.edgesToSuperview(insets: .init(top: 0, left: 15, bottom: 15, right: 15))
    }
}

// MARK: - Configure and Localize
extension RecipeDetailViewController {
    
    private func configureCollectionView() {
        commentsCollectionView.dataSource = self
        commentsCollectionView.delegate = self
    }
    
    private func setLocalize() {
        commentCountView.icon = .icComment
        commentCountView.info = L10n.General.comment
        likeCountView.icon = .icHeart.withRenderingMode(.alwaysTemplate)
        likeCountView.info = L10n.General.like
        ingredientsView.title = L10n.General.recipeIngredients
        ingredientsView.icon = .icRestaurant
        stepsView.title = L10n.General.recipeSteps
        stepsView.icon = .icClock
        commentButton.setTitle(L10n.General.addComment, for: .normal)
    }
    
    private func fillData() {
        recipeHeaderView.recipeHeaderData = viewModel.recipeHeaderCellItems
        topTitleView.recipeName = viewModel.recipeName
        topTitleView.categoryName = viewModel.categoryName
        topTitleView.timeDifferenceText = viewModel.timeDifferenceText
        commentCountView.count = viewModel.commentCount
        likeCountView.count = viewModel.likeCount
        likeCountView.iconColor = viewModel.isLiked ? .appRed : .appCinder
        userView.username = viewModel.username
        userView.recipeAndFollowerCountText = viewModel.recipeAndFollowerCountText
        userView.userImageUrl = viewModel.userImageUrl
        userView.isFollowing = viewModel.isFollowing
        ingredientsView.iconSubtitle = viewModel.numberOfPeople
        ingredientsView.info = viewModel.ingredients
        stepsView.iconSubtitle = viewModel.time
        stepsView.info = viewModel.steps
        commentsCollectionView.reloadData()
        commentsCollectionView.layoutIfNeeded()
    }
}

// MARK: - Actions
extension RecipeDetailViewController {
    
    private func subscribeActions() {
        likeCountView.iconButtonTapped = { [weak self] in
            guard let self = self else { return }
            self.viewModel.likeButtonTapped()
        }
        
        userView.followButtonTapped = { [weak self] in
            guard let self = self else { return }
            self.viewModel.followButtonTapped()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension RecipeDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.numberOfItemsAt(section: section) > 3 {
            return 3
        }
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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 195)
    }
    
}
// swiftlint:enable line_length
