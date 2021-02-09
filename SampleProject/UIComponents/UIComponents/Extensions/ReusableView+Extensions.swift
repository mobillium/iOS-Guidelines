//
//  ReusableView+Extensions.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit

public extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
