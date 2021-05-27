//
//  ScreenSize.swift
//  SampleProject
//
//  Created by Alperen Ünal on 16.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

enum ScreenSize {
    static let width        = UIScreen.main.bounds.size.width
    static let height       = UIScreen.main.bounds.size.height
    static let maxLength    = max(ScreenSize.width, ScreenSize.height)
    static let minLength    = min(ScreenSize.width, ScreenSize.height)
}
