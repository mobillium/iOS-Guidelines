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
        let width = UIScreen.main.bounds.width
        let processor = ResizingImageProcessor(referenceSize: CGSize(width: width, height: width), mode: .aspectFit)
        self.kf.setImage(with: url, placeholder: placeholder, options: [UIImageView.fadeAnimation, .processor(processor)])
    }
    
    func setImageScaled(_ string: String?, placeholder: UIImage? = nil) {
        self.kf.indicatorType = .activity
        let url = URL(string: string ?? "")
        let processor = ResizingImageProcessor(referenceSize: CGSize(width: 150, height: 150), mode: .aspectFit)
        self.kf.setImage(with: url, placeholder: placeholder, options: [UIImageView.fadeAnimation, .processor(processor)])
    }
   
}
