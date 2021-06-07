//
//  WalkThroughCellModel.swift
//  UIComponents
//
//  Created by Murat Celebi on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

public protocol WalkThroughCellDataSource: AnyObject {
    var image: UIImage { get }
    var titleText: String { get }
    var descriptionText: String { get }
}

public protocol WalkThroughCellEventSource: AnyObject {
    
}

public protocol WalkThroughCellProtocol: WalkThroughCellDataSource, WalkThroughCellEventSource {
    
}

public final class WalkThroughCellModel: WalkThroughCellProtocol {
    
    public var image: UIImage
    public var titleText: String
    public var descriptionText: String
    
    public init(image: UIImage, titleText: String, descriptionText: String) {
        self.image = image
        self.titleText = titleText
        self.descriptionText = descriptionText
    }
}
