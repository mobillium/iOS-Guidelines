//
//  UIFont+Extensions.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 26.02.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public extension UIFont {
    
    // MARK: NavigationBar
    /// interSemiBold - 13
    static let navigationTitle = interSemiBold(size: .small)
    static let navigationItem = interMedium(size: .small)
    
    // MARK: - Button
    /// interSemiBold - 13
    static let buttonPrimary = interSemiBold(size: .small)
    
    // MARK: - Text
    /// interMedium - 13
    static let textPrimary = interMedium(size: .small)
    
    enum FontWeight: String {
        case interRegular = "Inter-Regular"
        case interLight = "Inter-Light"
        case interMedium = "Inter-Medium"
        case interSemiBold = "Inter-SemiBold"
        case interBold = "Inter-Bold"
    }
    
    // swiftlint:disable identifier_name
    enum FontSize {
        /// 13
        case small
        
        /// 40
        case large
        
        /// 27
        case h1
        
        /// 21
        case h2
        
        /// 17
        case h3
        
        /// custom
        case custom(size: CGFloat)
        
        public var rawValue: CGFloat {
            switch self {
            case .small: return 13
            case .large:  return 40
            case .h1: return 27
            case .h2: return 21
            case .h3: return 17
            case .custom(let size):return size
            }
        }
    }
    // swiftlint:enable identifier_name
    
    static func font(_ weight: UIFont.FontWeight, size: FontSize) -> UIFont {
        let font: UIFont
        switch weight {
        case .interRegular:
            font = FontFamily.Inter.regular.font(size: size.rawValue)
        case .interLight:
            font = FontFamily.Inter.light.font(size: size.rawValue)
        case .interMedium:
            font = FontFamily.Inter.medium.font(size: size.rawValue)
        case .interSemiBold:
            font = FontFamily.Inter.semiBold.font(size: size.rawValue)
        case .interBold:
            font = FontFamily.Inter.bold.font(size: size.rawValue)
        }
        return font
    }
    
    static func interRegular(size: FontSize) -> UIFont {
        return FontFamily.Inter.regular.font(size: size.rawValue)
    }
    
    static func interLight(size: FontSize) -> UIFont {
        return FontFamily.Inter.light.font(size: size.rawValue)
    }
    
    static func interMedium(size: FontSize) -> UIFont {
        return FontFamily.Inter.medium.font(size: size.rawValue)
    }
    
    static func interSemiBold(size: FontSize) -> UIFont {
        return FontFamily.Inter.semiBold.font(size: size.rawValue)
    }
    
    static func interBold(size: FontSize) -> UIFont {
        return FontFamily.Inter.bold.font(size: size.rawValue)
    }
    
}
