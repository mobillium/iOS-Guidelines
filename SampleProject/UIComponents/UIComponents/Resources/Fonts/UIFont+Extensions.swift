//
//  UIFont+Extensions.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 26.02.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public extension UIFont {
        
    static func interRegular(size: CGFloat) -> UIFont {
        return FontFamily.Inter.regular.font(size: size)
    }
    
    static func interLight(size: CGFloat) -> UIFont {
        return FontFamily.Inter.light.font(size: size)
    }
    
    static func interMedium(size: CGFloat) -> UIFont {
        return FontFamily.Inter.medium.font(size: size)
    }
    
    static func interSemiBold(size: CGFloat) -> UIFont {
        return FontFamily.Inter.semiBold.font(size: size)
    }
    
    static func interBold(size: CGFloat) -> UIFont {
        return FontFamily.Inter.bold.font(size: size)
    }
    
    // MARK: NavigationBar
    /// interSemiBold - 13
    static let navigationTitle = interSemiBold(size: 13)
    static let navigationItem = interMedium(size: 13)
    
    // MARK: - Button
    /// interSemiBold - 13
    static let buttonPrimary = interSemiBold(size: 13)
    
    // MARK: - Text
    /// interMedium - 13
    static let textPrimary = interMedium(size: 13)

}
