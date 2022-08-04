//
//  CategoryWithRecipesCell.swift
//  UIComponents
//
//  Created by Murat Celebi on 25.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public class CategoryWithRecipesCell: UICollectionViewCell, ReusableView {
    
    private let topContainerView = UIView()
    
    private let categoryImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .build()
    
    private let categoryNameLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .textColor(.appCinder)
        .build()
    
    private let seeAllButton = UIButtonBuilder()
        .titleColor(.appRed)
        .titleFont(.font(.nunitoBold, size: .small))
        .backgroundColor(.clear)
        .build()
    
    private let seperator = UIViewBuilder()
        .backgroundColor(.appZircon)
        .build()
    
    var viewModel: CategoryWithRecipesCellProtocol?
    public let recipeSmallCellView = RecipeSmallCellView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        self.categoryImageView.image = nil
        self.categoryNameLabel.text = nil
    }
}

// MARK: - UILayout
extension CategoryWithRecipesCell {
    
    private func addSubViews() {
        backgroundColor = .white
        addTopContainerView()
        addSeperator()
        addRecipeSmallCellView()
    }
    
    private func addTopContainerView() {
        contentView.addSubview(topContainerView)
        topContainerView.edgesToSuperview(excluding: .bottom)
        topContainerView.height(44)
        topContainerView.addSubview(categoryImageView)
        categoryImageView.edgesToSuperview(excluding: .right, insets: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 0))
        categoryImageView.size(CGSize(width: 24, height: 24))
        topContainerView.addSubview(categoryNameLabel)
        categoryNameLabel.centerYToSuperview()
        categoryNameLabel.leadingToTrailing(of: categoryImageView).constant = 5
        topContainerView.addSubview(seeAllButton)
        seeAllButton.trailingToSuperview().constant = -15
        seeAllButton.centerYToSuperview()
        seeAllButton.addTarget(self, action: #selector(seeAllButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func addSeperator() {
        contentView.addSubview(seperator)
        seperator.topToBottom(of: topContainerView)
        seperator.size(CGSize(width: contentView.frame.width, height: 1))
    }
    
    private func addRecipeSmallCellView() {
        contentView.addSubview(recipeSmallCellView)
        recipeSmallCellView.edgesToSuperview(excluding: .top)
        recipeSmallCellView.topToBottom(of: seperator)
    }
}

// MARK: - Actions
extension CategoryWithRecipesCell {
    
    @objc
    private func seeAllButtonTapped(_ sender: UIButton) {
        guard let categoryId = viewModel?.categoryId, let categoryName = viewModel?.categoryName else { return }
        viewModel?.seeAllButtonTapped?(categoryId, categoryName)
    }
}

// MARK: - Set ViewModel
public extension CategoryWithRecipesCell {
    
    func set(with viewModel: CategoryWithRecipesCellProtocol) {
        self.viewModel = viewModel
        self.categoryImageView.setImage(viewModel.categoryImageURL)
        self.categoryNameLabel.text = viewModel.categoryName
        self.seeAllButton.setTitle(viewModel.seeAllButtonTitle, for: .normal)
        self.recipeSmallCellView.didSelectRecipe = viewModel.didSelectRecipe
        self.recipeSmallCellView.cellItems = viewModel.cellItems
    }
}
