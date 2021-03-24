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
        .masksToBounds(false)
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
    
    private let userRecipeAndFollowerCountLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appRaven)
        .build()
    
    private lazy var followButton = ButtonFactory.createPrimaryBorderedButton(style: .small)
    
    public var userImage: UIImage? {
        willSet {
            if let image = newValue {
                userImageView.image = image
            } else {
                userImageView.image = nil
            }
        }
    }
    
    public var userRecipeAndFollowerCountText: String? {
        willSet {
            if let text = newValue {
                userRecipeAndFollowerCountLabel.text = text
            } else {
                userRecipeAndFollowerCountLabel.text = nil
            }
        }
    }
    
    public var username: String? {
        willSet {
            if let username = newValue {
                usernameLabel.text = username
            } else {
                usernameLabel.text = nil
            }
        }
    }
    
    public enum UserViewType {
        case withFollowButton
        case withoutFollowButton
    }
    
    let userViewType: UserViewType
    
    init(userViewType: UserViewType) {
        self.userViewType = userViewType
        super.init(frame: .zero)
        configureContents()
        setDummyData()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    private func configureContents() {
        backgroundColor = .appWhite
        addSubview(userImageView)
        userImageView.centerYToSuperview()
        userImageView.leadingToSuperview().constant = 15
        userImageView.size(.init(width: 40, height: 40))
        
        addSubview(textStackView)
        textStackView.leadingToTrailing(of: userImageView).constant = 10
        textStackView.centerYToSuperview()
        textStackView.addArrangedSubview(usernameLabel)
        textStackView.addArrangedSubview(userRecipeAndFollowerCountLabel)
        
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
    
    private func setDummyData() {
        userImage = .imgWalkthrough1
        username = "mrtcelebi"
        userRecipeAndFollowerCountText = "1 Tarif 2 Takipçi"
    }
}
