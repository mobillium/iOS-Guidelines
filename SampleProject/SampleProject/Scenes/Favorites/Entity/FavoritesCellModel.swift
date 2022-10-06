//
//  FavoritesCellModel.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 27.07.2022.
//  Copyright © 2022 Mobillium. All rights reserved.
//

import Foundation

public final class FavoritesCellModel: CategoryWithRecipesCellProtocol {
    public let categoryId: Int
    public let categoryImageURL: String?
    public let categoryName: String?
    public let seeAllButtonTitle: String? = Localizable.Favorites.seeAllButtonTitle
    public var seeAllButtonTapped: TwoVariablesClosure<Int, String>?
    public let cellItems: [RecipeSmallCellProtocol]
    public var didSelectRecipe: IntClosure?
    
    init(category: MainCategory) {
        let cellItems = category.recipes.map({ FavoritesRecipeCellModel(recipe: $0) })
        self.categoryId = category.id
        self.categoryImageURL = nil
        self.categoryName = category.name
        self.cellItems = cellItems
    }
}
