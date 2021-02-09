//
//  ReusableView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit

public protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}
