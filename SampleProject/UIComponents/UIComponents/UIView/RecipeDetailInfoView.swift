//
//  RecipeDetailInfoView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 25.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

public class RecipeDetailInfoView: UIView {
    
    private let topContainerView = UIViewBuilder()
        .backgroundColor(.appWhite)
        .build()

    private let titleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appCinder)
        .build()
    
    private let stackView = UIStackViewBuilder()
        .spacing(2)
        .axis(.vertical)
        .alignment(.center)
        .build()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 17
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.appZircon.cgColor
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.tintColor = .appCinder
        imageView.size(.init(width: 34, height: 34))
        return imageView
    }()
    
    private let iconSubtitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .small))
        .textColor(.appRaven)
        .build()
    
    private let seperatorView: UIView = {
        let view = UIView()
        view.height(1)
        view.backgroundColor = .appZircon
        return view
    }()
    
    private let informationLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .textColor(.appCinder)
        .numberOfLines(0)
        .build()
    
    public var title: String? {
        willSet {
            titleLabel.text = newValue
        }
    }
    
    public var icon: UIImage? {
        willSet {
            iconImageView.image = newValue?.resize(to: .init(width: 18, height: 18))
        }
    }
    
    public var iconSubtitle: String? {
        willSet {
            iconSubtitleLabel.text = newValue
        }
    }
    
    public var info: String? {
        willSet {
            informationLabel.text = newValue
        }
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }

    private func setupConstraints() {
        backgroundColor = .white
        addSubview(topContainerView)
        topContainerView.edgesToSuperview(excluding: .bottom)
        topContainerView.height(78)
        
        topContainerView.addSubview(titleLabel)
        titleLabel.leadingToSuperview().constant = 15
        titleLabel.centerYToSuperview()
        
        topContainerView.addSubview(stackView)
        stackView.trailingToSuperview().constant = -15
        stackView.centerYToSuperview()
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(iconSubtitleLabel)
        
        addSubview(seperatorView)
        seperatorView.topToBottom(of: topContainerView)
        seperatorView.edgesToSuperview(excluding: [.top, .bottom])
        
        addSubview(informationLabel)
        informationLabel.topToBottom(of: seperatorView, offset: 10)
        informationLabel.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 15, bottom: 10, right: 15))
    }
}
