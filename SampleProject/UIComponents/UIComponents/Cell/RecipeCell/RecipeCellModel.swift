//
//  RecipeCellModel.swift
//  UIComponents
//
//  Created by Murat Celebi on 24.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public protocol RecipeCellDataSource: AnyObject {
    var userImageUrl: String? { get }
    var username: String? { get }
    var userFollowerCount: Int { get }
    var userRecipeCount: Int { get }
    var userRecipeAndFollowerCountText: String? { get }
    var recipeTitle: String? { get }
    var categoryName: String? { get }
    var recipeImageUrl: String? { get }
    var commentCount: Int { get }
    var likeCount: Int { get }
    var recipeCommnetAndLikeCountText: String? { get }
    var isEditorChoice: Bool { get }
}

public protocol RecipeCellEventSource: AnyObject {
    var followButtonTapped: VoidClosure? { get set }
}

public protocol RecipeCellProtocol: RecipeCellDataSource, RecipeCellEventSource {}
