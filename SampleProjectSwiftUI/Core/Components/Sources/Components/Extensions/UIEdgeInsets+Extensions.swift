//
//  UIEdgeInsets+Extensions.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 6.10.2022.
//

import SwiftUI

public extension UIEdgeInsets {
    
    var insets: EdgeInsets {
        return EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
