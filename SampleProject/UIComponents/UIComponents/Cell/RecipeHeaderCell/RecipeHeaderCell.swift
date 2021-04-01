//
//  RecipeHeaderCell.swift
//  UIComponents
//
//  Created by Emirhan Battalbaş on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public class RecipeHeaderCell: UICollectionViewCell, ReusableView {
    
    private let headerImageView = UIImageViewBuilder()
        .backgroundColor(.clear)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureConstraints()
    }
    
    private func configureConstraints() {
        headerImageView.edgesToSuperview()
    }
}

public extension RecipeHeaderCell {
    func set(with viewModel: RecipeHeaderCellProtocol) {
        headerImageView.setImage(viewModel.imageUrl)
    }
}
