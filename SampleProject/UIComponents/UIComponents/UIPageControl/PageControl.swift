//
//  PageControl.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 25.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

public class PageControl: UIPageControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    private func configureContents() {
        tintColor = .appRed
        pageIndicatorTintColor = UIColor.appRed.withAlphaComponent(0.3)
        currentPageIndicatorTintColor = .appRed
    }
    
}
