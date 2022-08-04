//
//  Model.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 27.07.2022.
//  Copyright © 2022 Mobillium. All rights reserved.
//

import UIKit

public protocol RecipeSmallCellDataSource: AnyObject {
    var recipeId: Int { get }
    var userImageUrl: String? { get }
    var username: String? { get }
    var recipeTitle: String? { get }
    var categoryName: String? { get }
    var recipeImageUrl: String? { get }
    var commentCount: Int { get }
    var likeCount: Int { get }
    var recipeCommnetAndLikeCountText: String? { get }
    var isEditorChoice: Bool { get }
}

public protocol RecipeSmallCellEventSource: AnyObject {
    var followButtonTapped: VoidClosure? { get set }
}

public protocol RecipeSmallCellProtocol: RecipeSmallCellDataSource, RecipeSmallCellEventSource {}

