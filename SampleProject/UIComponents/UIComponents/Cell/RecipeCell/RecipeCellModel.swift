//
//  RecipeCellModel.swift
//  UIComponents
//
//  Created by Murat Celebi on 24.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public protocol RecipeCellDataSource: AnyObject {
    var id: Int { get }
    var userImageUrl: String? { get }
    var username: String? { get }
    var userRecipeAndFollowerCountText: String? { get }
    var recipeTitle: String? { get }
    var categoryName: String? { get }
    var recipeImageUrl: String? { get }
    var recipeCommnetAndLikeCountText: String? { get }
    var isEditorChoice: Bool? { get }
}

public protocol RecipeCellEventSource: AnyObject {
    
}

public protocol RecipeCellProtocol: RecipeCellDataSource, RecipeCellEventSource {}

public class RecipeCellModel: RecipeCellProtocol {
    public var id: Int
    public var userImageUrl: String?
    public var username: String?
    public var userRecipeAndFollowerCountText: String?
    public var recipeTitle: String?
    public var categoryName: String?
    public var recipeImageUrl: String?
    public var recipeCommnetAndLikeCountText: String?
    public var isEditorChoice: Bool?
    
    public init(id: Int) {
        self.id = id
    }
}
