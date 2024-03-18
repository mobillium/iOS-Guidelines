//
//  EnvironmentValues+Extensions.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 6.10.2022.
//

import UIKit
import SwiftUI

public struct SafeAreaInsetsKey: EnvironmentKey {
    public static var defaultValue: EdgeInsets {
        return (UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets ?? .zero).insets
    }
}

public extension EnvironmentValues {
    
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}
