//
//  ActivityIndicatorFooterView.swift
//  UIComponents
//
//  Created by Muart Celebi on 02.06.2021.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit

public class ActivityIndicatorFooterView: UICollectionReusableView, ReusableView {
    
    public let activityIndicator = ActivityIndicatorView(frame: .infinite)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }

    private func setupConstraints() {
        addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
    }
}
