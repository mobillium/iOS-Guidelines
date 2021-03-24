//
//  UIImageView+Extensions.swift
//  UIComponents
//
//  Created by Catalina on 8.01.2021.
//

import UIKit
import Kingfisher

public extension UIImageView {
    static let fadeAnimation = KingfisherOptionsInfoItem.transition(.fade(0.2))
    
    func setImage(_ string: String?, placeholder: UIImage? = nil) {
        self.kf.indicatorType = .activity
        let url = URL(string: string ?? "")
        
        self.kf.setImage(with: url, placeholder: placeholder, options: [UIImageView.fadeAnimation])
    }
   
}
