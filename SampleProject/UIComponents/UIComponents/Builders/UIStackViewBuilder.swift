//
//  UIStackViewBuilder.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit

public class UIStackViewBuilder {
    
    private var axis: NSLayoutConstraint.Axis?
    private var spacing: CGFloat?
    private var alignment: UIStackView.Alignment?
    private var distribution: UIStackView.Distribution?
    
    public init() {}
    
    public func axis(_ axis: NSLayoutConstraint.Axis) -> Self {
        self.axis = axis
        return self
    }
    
    public func spacing(_ spacing: CGFloat) -> Self {
        self.spacing = spacing
        return self
    }
    
    public func alignment(_ alignment: UIStackView.Alignment) -> Self {
        self.alignment = alignment
        return self
    }
    
    public func distribution(_ distribution: UIStackView.Distribution) -> Self {
        self.distribution = distribution
        return self
    }
    
    public func build() -> UIStackView {
        let stackView = UIStackView()
        if let axis = self.axis {
            stackView.axis = axis
        }
        if let spacing = self.spacing {
            stackView.spacing = spacing
        }
        if let alignment = self.alignment {
            stackView.alignment = alignment
        }
        if let distribution = self.distribution {
            stackView.distribution = distribution
        }
        return stackView
    }
    
}
