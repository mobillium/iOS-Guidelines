//
//  ButtonFactory.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 22.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

public class ButtonFactory {
    
    public enum Style {
        case large
        case medium
        case small
        
        var height: CGFloat {
            switch self {
            case .large: return 60
            case .medium: return 50
            case .small: return 40
            }
        }
        
        var fontSize: UIFont.FontSize {
            switch self {
            case .large: return .xLarge
            case .medium: return .medium
            case .small: return .medium
            }
        }
    }
    
    public static func createPrimaryButton(style: Style) -> UIButton {
        let button = UIButtonBuilder()
            .titleFont(.font(.nunitoBold, size: style.fontSize))
            .titleColor(.appWhite)
            .backgroundColor(.appRed)
            .cornerRadius(4)
            .build()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: style.height).isActive = true
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        return button
    }
    
    public static func createPrimaryBorderedButton(style: Style) -> UIButton {
        let button = UIButtonBuilder()
            .titleFont(.font(.nunitoBold, size: style.fontSize))
            .titleColor(.appRed)
            .backgroundColor(.appWhite)
            .cornerRadius(4)
            .borderWidth(2)
            .borderColor(UIColor.appRed.cgColor)
            .build()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: style.height).isActive = true
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        return button
    }
    
}
