//
//  RecipeDetailTitlesView.swift
//  UIComponents
//
//  Created by Murat Celebi on 1.06.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public class RecipeDetailTitlesView: UIView {
    
    private let titleStackView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
    
    private let recipeNameLabel = UILabelBuilder()
        .textColor(.appCinder)
        .font(.font(.nunitoBold, size: .xLarge))
        .build()
    
    private let categoryNameLabel = UILabelBuilder()
        .textColor(.appRaven)
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .build()
    
    private let timeDifferenceLabel = UILabelBuilder()
        .textColor(.appRaven)
        .font(.font(.nunitoSemiBold, size: .medium))
        .textAlignment(.right)
        .build()
    
    public var recipeName: String? {
        willSet {
            recipeNameLabel.text = newValue
        }
    }
    
    public var categoryName: String? {
        willSet {
            categoryNameLabel.text = newValue
        }
    }
    
    public var timeDifferenceText: String? {
        willSet {
            timeDifferenceLabel.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        backgroundColor = .appWhite
        addSubview(titleStackView)
        titleStackView.edgesToSuperview(excluding: .trailing, insets: UIEdgeInsets(top: 11, left: 15, bottom: 11, right: 0))
        titleStackView.addArrangedSubview(recipeNameLabel)
        titleStackView.addArrangedSubview(categoryNameLabel)
        
        addSubview(timeDifferenceLabel)
        timeDifferenceLabel.leadingToTrailing(of: titleStackView).constant = 10
        timeDifferenceLabel.trailingToSuperview().constant = -15
        timeDifferenceLabel.centerYToSuperview()
    }
    
}
