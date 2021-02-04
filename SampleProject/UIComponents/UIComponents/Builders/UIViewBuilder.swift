//
//  UIViewBuilder.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit

public class UIViewBuilder {
 
    private var backgroundColor: UIColor?
    
    public init() {}
    
    public func backgroundColor(_ backgroundColor: UIColor) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    public func build() -> UIView {
        let view = UIView()
        if let backgroundColor = self.backgroundColor {
            view.backgroundColor = backgroundColor
        }
        return view
    }
    
}
