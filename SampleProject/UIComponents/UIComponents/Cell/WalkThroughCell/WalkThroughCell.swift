//
//  WalkThroughCell.swift
//  UIComponents
//
//  Created by Murat Celebi on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public class WalkThroughCell: UICollectionViewCell, ReusableView {
    
    private let imageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .build()
    
    private let textStackView = UIStackViewBuilder()
        .spacing(10)
        .axis(.vertical)
        .build()
    
    private let titleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xxLarge))
        .textAlignment(.center)
        .textColor(.appCinder)
        .build()
    
    private let descriptionLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .textAlignment(.center)
        .numberOfLines(0)
        .textColor(.appRaven)
        .build()
    
    weak var viewModel: WalkThroughCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        contentView.backgroundColor = .appWhite
        
        contentView.addSubview(imageView)
        imageView.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50))
        imageView.centerYToSuperview()
        imageView.aspectRatio(1)
        
        contentView.addSubview(textStackView)
        textStackView.edgesToSuperview(excluding: .top, insets: UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50))
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(descriptionLabel)
    }
    
    public func set(viewModel: WalkThroughCellProtocol) {
        self.viewModel = viewModel
        self.imageView.image = viewModel.image
        self.titleLabel.text = viewModel.titleText
        self.descriptionLabel.text = viewModel.descriptionText
    }
    
}
