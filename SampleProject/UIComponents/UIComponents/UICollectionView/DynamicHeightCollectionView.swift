//
//  DynamicHeightCollectionView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 15.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

public class DynamicHeightCollectionView: UICollectionView {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if !(__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize)) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
