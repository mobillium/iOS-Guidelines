//
//  UIScrollViewBuilder.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit

public class UIScrollViewBuilder {
    
    private var showsVerticalScrollIndicator: Bool?
    private var showsHorizontalScrollIndicator: Bool?
    private var backgroundColor: UIColor?
    
    public init() {}
    
    public func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> Self {
        self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }
    
    public func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> Self {
        self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }
    
    public func backgroundColor(_ backgroundColor: UIColor) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    public func build() -> UIScrollView {
        let scrollView = UIScrollView()
        if let showsVerticalScrollIndicator = self.showsVerticalScrollIndicator {
            scrollView.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        }
        if let showsHorizontalScrollIndicator = self.showsHorizontalScrollIndicator {
            scrollView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        }
        if let backgroundColor = self.backgroundColor {
            scrollView.backgroundColor = backgroundColor
        }
        return scrollView
    }
    
}
