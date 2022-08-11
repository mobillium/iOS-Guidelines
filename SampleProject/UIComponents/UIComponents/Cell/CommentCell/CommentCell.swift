//
//  CommentCell.swift
//  UIComponents
//
//  Created by Murat Celebi on 25.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public class CommentCell: UICollectionViewCell, ReusableView {

    private let userView = UserView(userViewType: .withoutFollowButton)
    
    private let timeDifferenceLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xSmall))
        .textColor(.appRaven)
        .build()
    
    private let commentLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appCinder)
        .numberOfLines(0)
        .build()
    
    private let moreButton = UIButtonBuilder()
        .backgroundColor(.clear)
        .image(UIImage.icMore.withRenderingMode(.alwaysTemplate))
        .tintColor(.appCinder)
        .build()
    
    private lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    public var isMoreButtonHidden: Bool? {
        willSet {
            moreButton.isHidden = newValue ?? false
        }
    }
    
    weak var viewModel: CommentCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
    }
    
    public override func systemLayoutSizeFitting(_ targetSize: CGSize,
                                                 withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
                                                 verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        self.userView.userImageUrl = nil
        self.userView.username = nil
        self.userView.recipeAndFollowerCountText = nil
        self.timeDifferenceLabel.text = nil
        self.commentLabel.text = nil
        self.moreButton.isHidden = true
    }
}

// MARK: - UILayout
extension CommentCell {
    
    private func addSubViews() {
        backgroundColor = .white
        contentView.addSubview(userView)
        userView.edgesToSuperview(excluding: [.bottom, .trailing])
        userView.height(70)
        
        contentView.addSubview(timeDifferenceLabel)
        timeDifferenceLabel.topToBottom(of: userView)
        timeDifferenceLabel.leadingToSuperview().constant = 15
        timeDifferenceLabel.trailingToSuperview().constant = -15
        
        contentView.addSubview(commentLabel)
        commentLabel.topToBottom(of: timeDifferenceLabel).constant = 7
        commentLabel.edgesToSuperview(excluding: .top, insets: UIEdgeInsets(top: 0, left: 15, bottom: 5, right: 15))
        
        contentView.addSubview(moreButton)
        moreButton.topToSuperview(offset: 10)
        moreButton.trailingToSuperview(offset: 15)
        moreButton.leadingToTrailing(of: userView).constant = 15
        moreButton.size(CGSize(width: 18, height: 10))
        moreButton.addTarget(self, action: #selector(moreButtonTapped(_:)), for: .touchUpInside)
    }
}

// MARK: - Actions
extension CommentCell {
    
    @objc
    private func moreButtonTapped(_ sender: UIButton) {
        viewModel?.moreButtonTapped?()
    }
}

// MARK: - Set ViewModel
public extension CommentCell {
    
    func set(with viewModel: CommentCellProtocol) {
        self.viewModel = viewModel
        self.userView.userImageUrl = viewModel.imageUrl
        self.userView.username = viewModel.username
        self.userView.recipeAndFollowerCountText = viewModel.userRecipeAndFollowerCountText
        self.timeDifferenceLabel.text = viewModel.timeDifferenceText
        self.commentLabel.text = viewModel.commentText
        self.moreButton.isHidden = !viewModel.isOwner
        self.viewModel?.commentTextDidChanged = { [weak self] in
            self?.commentLabel.text = self?.viewModel?.commentText
        }
    }
}
