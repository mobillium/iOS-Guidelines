//
//  UIImage+Extensions.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 24.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Kingfisher

public extension UIImage {
    
    func resize(to size: CGSize, for contentMode: UIView.ContentMode? = nil) -> UIImage {
        switch contentMode {
        case .scaleAspectFit:
            return kf.resize(to: size, for: .aspectFit)
        case .scaleToFill:
            return kf.resize(to: size, for: .aspectFill)
        default:
            return kf.resize(to: size)
        }
    }
    
}
