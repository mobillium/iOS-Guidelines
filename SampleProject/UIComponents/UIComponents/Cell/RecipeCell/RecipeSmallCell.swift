//
//  CategoryRecipesCell.swift
//  UIComponents
//
//  Created by Murat Celebi on 25.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public class RecipeSmallCell: UICollectionViewCell, ReusableView {
    
    private let recipeImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
        .build()
    
    private let userImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.appRed.cgColor
        image.backgroundColor = .white
        return image
    }()
    
    private let usernameLabel: PaddingLabel = {
        let label = PaddingLabel(withInsets: 10, 10, 12, 8)
        label.font = .font(.nunitoBold, size: .xSmall)
        label.textColor = .appWhite
        label.layer.cornerRadius = 10
        label.clipsToBounds = false
        label.layer.masksToBounds = true
        label.backgroundColor = .appRed
        return label
    }()
    
    private let recipeInformationView = UIView()
    
    private let recipeInformationStackView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
    
    private let recipeTitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .small))
        .textColor(.appCinder)
        .adjustsFontSizeToFitWidth(true)
        .build()
    
    private let recipeCommentAndLikeCountLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .small))
        .textColor(.appRaven)
        .build()
    
    weak var viewModel: RecipeSmallCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCellShadowAndRadius()
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCellShadowAndRadius()
        addSubViews()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        self.recipeImageView.image = nil
        self.userImageView.image = nil
        self.usernameLabel.text = nil
        self.recipeTitleLabel.text = nil
        self.recipeCommentAndLikeCountLabel.text = nil
    }
}

// MARK: - UILayout
extension RecipeSmallCell {
    
    private func addSubViews() {
        contentView.backgroundColor = .white
        addRecipeImageView()
        addUserImageView()
        addUserNameLabel()
        contentView.bringSubviewToFront(userImageView)
        addRecipeInformationView()

    }
    
    private func addRecipeImageView() {
        contentView.addSubview(recipeImageView)
        recipeImageView.edgesToSuperview(excluding: .bottom)
        recipeImageView.aspectRatio(1 / 1)
    }
    
    private func addUserImageView() {
        contentView.addSubview(userImageView)
        userImageView.top(to: recipeImageView).constant = 5
        userImageView.leading(to: recipeImageView).constant = 5
        userImageView.size(.init(width: 30, height: 30))
    }
    
    private func addUserNameLabel() {
        contentView.addSubview(usernameLabel)
        usernameLabel.leadingToTrailing(of: userImageView).constant = -12
        usernameLabel.centerY(to: userImageView)
        usernameLabel.height(20)
    }
    
    private func addRecipeInformationView() {
        contentView.addSubview(recipeInformationView)
        recipeInformationView.topToBottom(of: recipeImageView)
        recipeInformationView.edgesToSuperview(excluding: .top)
        
        recipeInformationView.addSubview(recipeInformationStackView)
        recipeInformationStackView.centerYToSuperview()
        recipeInformationStackView.leadingToSuperview().constant = 10
        recipeInformationStackView.trailingToSuperview().constant = -10
        recipeInformationStackView.addArrangedSubview(recipeTitleLabel)
        recipeInformationStackView.addArrangedSubview(recipeCommentAndLikeCountLabel)
    }
}

// MARK: - Configure
extension RecipeSmallCell {
    
    private func configureCellShadowAndRadius() {
        contentView.layer.cornerRadius = 4
        layer.cornerRadius = 4
        layer.masksToBounds = false
        contentView.clipsToBounds = true
        layer.borderWidth = 0.0
        layer.shadowColor = UIColor.appCinder.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.2
    }
}

// MARK: - Set ViewModel
public extension RecipeSmallCell {
    
    func set(with viewModel: RecipeSmallCellProtocol) {
        self.viewModel = viewModel
        self.recipeImageView.setImageScaled(viewModel.recipeImageUrl)
        self.userImageView.setImageScaled(viewModel.userImageUrl)
        self.usernameLabel.text = viewModel.username
        self.recipeTitleLabel.text = viewModel.recipeTitle
        self.recipeCommentAndLikeCountLabel.text = viewModel.recipeCommnetAndLikeCountText
    }
}
