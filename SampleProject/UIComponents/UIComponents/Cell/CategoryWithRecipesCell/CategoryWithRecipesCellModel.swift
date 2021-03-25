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
    var cellItems: [RecipeCellProtocol] { get }
}

public protocol CategoryWithRecipesCellEventSource: AnyObject {
    var didSelectRecipe: IntClosure? { get set }
    var seeAllButtonTapped: ((Int, String) -> Void)? { get set }
}

public protocol CategoryWithRecipesCellProtocol: CategoryWithRecipesCellDataSource, CategoryWithRecipesCellEventSource {
    
}

public final class CategoryWithRecipesCellModel: CategoryWithRecipesCellProtocol {
    public var categoryId: Int
    public var categoryImageURL: String?
    public var categoryName: String?
    public var seeAllButtonTapped: ((Int, String) -> Void)?
    public var cellItems: [RecipeCellProtocol]
    public var didSelectRecipe: IntClosure?
    
    public init(categoryId: Int, categoryImageURL: String?, categoryName: String?, cellItems: [RecipeCellProtocol]) {
        self.categoryId = categoryId
        self.categoryImageURL = categoryImageURL
        self.categoryName = categoryName
        self.cellItems = cellItems
    }
}
