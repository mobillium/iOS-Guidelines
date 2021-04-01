//
//  RecipeCell.swift
//  UIComponents
//
//  Created by Murat Celebi on 24.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public class RecipeCell: UICollectionViewCell, ReusableView {
    
    private let userView = UserView(userViewType: .withoutFollowButton)
    
    private let separatorLine = UIViewBuilder()
        .backgroundColor(.appZircon)
        .build()
    
    private let recipeTitlesContainerView = UIView()
    
    private let recipeTitleStackView = UIStackViewBuilder()
        .axis(.vertical)
        .distribution(.fillEqually)
        .build()
    
    private let recipeTitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appCinder)
        .build()
    
    private let recipeCategoryLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .textColor(.appRaven)
        .build()
    
    private let recipeImageView = UIImageViewBuilder()
        .cornerRadius(4)
        .clipsToBounds(true)
        .contentMode(.scaleAspectFill)
        .build()
    
    private let editoryPickImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        let image = UIImage.imgEditorsPick.resize(to: .init(width: 20, height: 24), for: .scaleAspectFit)
        imageView.image = image
        imageView.size(.init(width: 40, height: 40))
        imageView.layer.cornerRadius = 20
        imageView.layer.shadowColor = UIColor.appCinder.cgColor
        imageView.layer.shadowOpacity = 0.40
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 4
        imageView.backgroundColor = .appWhite
        return imageView
    }()
    
    private let recipeCommentAndLikeContainerView = UIView()
    
    private let recipeCommentAndLikeCountLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appRaven)
        .build()
    
    weak var viewModel: RecipeCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureConstraints()
    }
    
    private func configureConstraints() {
        backgroundColor = .white
        
        contentView.addSubview(userView)
        userView.edgesToSuperview(excluding: .bottom)
        userView.height(70)
        
        contentView.addSubview(separatorLine)
        separatorLine.topToBottom(of: userView)
        separatorLine.edgesToSuperview(excluding: [.bottom, .top])
        separatorLine.height(1)
        
        contentView.addSubview(recipeTitlesContainerView)
        recipeTitlesContainerView.topToBottom(of: separatorLine)
        recipeTitlesContainerView.leadingToSuperview().constant = 15
        recipeTitlesContainerView.trailingToSuperview().constant = -15
        recipeTitlesContainerView.height(61)
        
        recipeTitlesContainerView.addSubview(recipeTitleStackView)
        recipeTitleStackView.edgesToSuperview(excluding: [.top, .bottom])
        recipeTitleStackView.centerYToSuperview()
        recipeTitleStackView.addArrangedSubview(recipeTitleLabel)
        recipeTitleStackView.addArrangedSubview(recipeCategoryLabel)
        
        contentView.addSubview(recipeImageView)
        recipeImageView.topToBottom(of: recipeTitlesContainerView)
        recipeImageView.leadingToSuperview().constant = 15
        recipeImageView.trailingToSuperview().constant = -15
        recipeImageView.aspectRatio(1 / 1)
        
        contentView.addSubview(editoryPickImageView)
        editoryPickImageView.top(to: recipeImageView).constant = 15
        editoryPickImageView.trailing(to: recipeImageView).constant = -15
        
        contentView.addSubview(recipeCommentAndLikeContainerView)
        recipeCommentAndLikeContainerView.topToBottom(of: recipeImageView)
        recipeCommentAndLikeContainerView.leadingToSuperview().constant = 15
        recipeCommentAndLikeContainerView.trailingToSuperview().constant = -15
        recipeCommentAndLikeContainerView.height(43)
        
        recipeCommentAndLikeContainerView.addSubview(recipeCommentAndLikeCountLabel)
        recipeCommentAndLikeCountLabel.centerYToSuperview()
        recipeCommentAndLikeCountLabel.edgesToSuperview(excluding: [.top, .bottom])
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        self.userView.username = nil
        self.userView.userImageUrl = nil
        self.userView.recipeAndFollowerCountText = nil
        self.recipeTitleLabel.text = nil
        self.recipeCategoryLabel.text = nil
        self.recipeImageView.image = nil
        self.recipeCommentAndLikeCountLabel.text = nil
    }
    
}

// MARK: - Set ViewModel
public extension RecipeCell {
    func set(viewModel: RecipeCellProtocol) {
        self.viewModel = viewModel
        userView.username = viewModel.username
        userView.recipeAndFollowerCountText = viewModel.userRecipeAndFollowerCountText
        userView.userImageUrl = viewModel.userImageUrl
        recipeTitleLabel.text = viewModel.recipeTitle
        recipeCategoryLabel.text = viewModel.categoryName
        recipeCommentAndLikeCountLabel.text = viewModel.recipeCommnetAndLikeCountText
        recipeImageView.setImage(viewModel.recipeImageUrl)
        editoryPickImageView.isHidden = !viewModel.isEditorChoice
    }
}
