//
//  RecipeHeaderCellModel.swift
//  UIComponents
//
//  Created by Emirhan Battalbaş on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

public protocol RecipeHeaderCellDataSource {
    var imageUrl: String { get }
    var isEditorChoice: Bool { get }
}

public protocol RecipeHeaderCellEventSource {
    
}

public protocol RecipeHeaderCellProtocol: RecipeHeaderCellDataSource, RecipeHeaderCellEventSource {
    
}
