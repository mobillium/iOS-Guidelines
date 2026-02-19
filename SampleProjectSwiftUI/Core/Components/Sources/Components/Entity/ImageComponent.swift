//
//  ImageComponent.swift
//  Components
//
//  Created by Mehmet Salih Aslan on 19.02.2026.
//

import Foundation

public struct ImageComponent {
    public let imageName: String
    public let bundle: Bundle
    
    public init(imageName: String, bundle: Bundle) {
        self.imageName = imageName
        self.bundle = bundle
    }
}
