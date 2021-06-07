//
//  EmptyCell.swift
//  UIComponents
//
//  Created by Murat Celebi on 4.06.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public class EmptyCell: UICollectionViewCell, ReusableView {
    
    private let infoLabel = UILabelBuilder()
        .textAlignment(.center)
        .numberOfLines(0)
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .textColor(.appRaven)
        .build()
    
    public var infoText: String? {
        willSet {
            infoLabel.text = newValue
        }
    }
    
    private lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    weak var viewModel: EmptyCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
    
    public override func systemLayoutSizeFitting(_ targetSize: CGSize,
                                                 withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
                                                 verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
}

// MARK: - UILayout
extension EmptyCell {
    
    private func addSubViews() {
        contentView.backgroundColor = .appWhite
        contentView.addSubview(infoLabel)
        infoLabel.edgesToSuperview(insets: UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20))
    }
}

// MARK: - Set ViewModel
public extension EmptyCell {
    
    func set(viewModel: EmptyCellProtocol) {
        self.viewModel = viewModel
    }
}
