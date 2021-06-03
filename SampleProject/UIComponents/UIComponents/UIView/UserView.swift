//
//  UserView.swift
//  UIComponents
//
//  Created by Murat Celebi on 24.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public class UserView: UIView {
    
    private let userImageView = UIImageViewBuilder()
        .cornerRadius(20)
        .clipsToBounds(true)
        .contentMode(.scaleToFill)
        .build()
    
    private let textStackView = UIStackViewBuilder()
        .axis(.vertical)
        .distribution(.fillEqually)
        .build()
    
    private let usernameLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .textColor(.appCinder)
        .build()
    
    private let recipeAndFollowerCountLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appRaven)
        .build()
    
    private lazy var followButton = ButtonFactory.createPrimaryBorderedButton(style: .small)
    
    public var userImageUrl: String? {
        willSet {
            if let url = newValue {
                userImageView.setImage(url)
            } else {
                userImageView.image = nil
            }
        }
    }
    
    public var recipeAndFollowerCountText: String? {
        willSet {
            recipeAndFollowerCountLabel.text = newValue
        }
    }
    
    public var username: String? {
        willSet {
            usernameLabel.text = newValue
        }
    }
    
    public enum UserViewType {
        case withFollowButton
        case withoutFollowButton
    }
    
    let userViewType: UserViewType
    
    /// Only use this variable when you enable followButton
    public var isFollowing: Bool = false {
        didSet {
            updateFollowButton()
        }
    }
    
    public var followButtonTapped: VoidClosure?
    
    public init(userViewType: UserViewType) {
        self.userViewType = userViewType
        super.init(frame: .zero)
        configureContents()
        addButtonTarget()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    private func configureContents() {
        backgroundColor = .appWhite
        addSubview(userImageView)
        userImageView.edgesToSuperview(excluding: .trailing, insets: .init(top: 15, left: 15, bottom: 15, right: 15))
        userImageView.size(.init(width: 40, height: 40))
        
        addSubview(textStackView)
        textStackView.leadingToTrailing(of: userImageView).constant = 10
        textStackView.centerYToSuperview()
        textStackView.addArrangedSubview(usernameLabel)
        textStackView.addArrangedSubview(recipeAndFollowerCountLabel)
        
        switch userViewType {
        case .withFollowButton:
            addSubview(followButton)
            followButton.trailingToSuperview().constant = -15
            followButton.leadingToTrailing(of: textStackView).constant = 10
            followButton.centerYToSuperview()
            followButton.width(120)
        case .withoutFollowButton:
            textStackView.trailingToSuperview().constant = -15
        }
    }
    
    private func addButtonTarget() {
        followButton.addTarget(self, action: #selector(followButtonTapped(_:)), for: .touchUpInside)
    }
    
    @IBAction private func followButtonTapped(_ sender: Any?) {
        followButtonTapped?()
    }
    
    private func updateFollowButton() {
        if isFollowing {
            followButton.setTitle(L10n.General.following, for: .normal)
            followButton.setTitleColor(.white, for: .normal)
            followButton.backgroundColor = .appRed
        } else {
            followButton.setTitle(L10n.General.follow, for: .normal)
            followButton.setTitleColor(.appRed, for: .normal)
            followButton.backgroundColor = .appWhite
        }
    }
    
}
