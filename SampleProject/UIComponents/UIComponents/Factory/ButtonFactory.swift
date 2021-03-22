//
//  ButtonFactory.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 22.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

public class ButtonFactory {
    
    public static func createPrimaryButton() -> UIButton {
        let button = UIButtonBuilder()
            .titleFont(.systemFont(ofSize: 15, weight: .bold))
            .titleColor(.white)
            .backgroundColor(.red)
            .cornerRadius(4)
            .build()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        return button
    }
    
}
