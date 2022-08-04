//
//  CategoryWithRecipesCellModel.swift
//  UIComponents
//
//  Created by Murat Celebi on 25.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

public protocol CategoryWithRecipesCellDataSource: AnyObject {
    var categoryId: Int { get }
    var categoryImageURL: String? { get }
    var categoryName: String? { get }
    var seeAllButtonTitle: String? { get }
    var cellItems: [RecipeSmallCellProtocol] { get }
}

public protocol CategoryWithRecipesCellEventSource: AnyObject {
    var didSelectRecipe: IntClosure? { get set }
    var seeAllButtonTapped: ((Int, String) -> Void)? { get set }
}

public protocol CategoryWithRecipesCellProtocol: CategoryWithRecipesCellDataSource, CategoryWithRecipesCellEventSource {}
