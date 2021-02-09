//
//  UILabelBuilder.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit

public class UILabelBuilder {
 
    private var textAlignment: NSTextAlignment?
    private var textColor: UIColor?
    private var font: UIFont?
    private var numberOfLines: Int?
    private var text: String?
    private var attributedText: NSAttributedString?
    
    public init() {}
    
    public func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
    
    public func textColor(_ textColor: UIColor) -> Self {
        self.textColor = textColor
        return self
    }
    
    public func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    public func numberOfLines(_ numberOfLines: Int) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }
    
    public func text(_ text: String) -> Self {
        self.text = text
        return self
    }
    
    public func attributedText(_ attributedText: NSAttributedString) -> Self {
        self.attributedText = attributedText
        return self
    }
    
    public func build() -> UILabel {
        let label = UILabel()
        if let textAlignment = self.textAlignment {
            label.textAlignment = textAlignment
        }
        if let textColor = self.textColor {
            label.textColor = textColor
        }
        if let font = self.font {
            label.font = font
        }
        if let numberOfLines = self.numberOfLines {
            label.numberOfLines = numberOfLines
        }
        if let text = self.text {
            label.text = text
        }
        if let attributedText = self.attributedText {
            label.attributedText = attributedText
        }
        return label
    }
    
}
