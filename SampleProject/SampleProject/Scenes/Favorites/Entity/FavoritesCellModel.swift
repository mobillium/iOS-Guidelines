//
//  FavoritesCellModel.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 27.07.2022.
//  Copyright © 2022 Mobillium. All rights reserved.
//

import Foundation

public final class FavoritesCellModel: CategoryWithRecipesCellProtocol {
    public var categoryId: Int
    public var categoryImageURL: String?
    public var categoryName: String?
    public var seeAllButtonTitle: String? = {
        return Localizable.Favorites.seeAllButtonTitle
    }()
    public var seeAllButtonTapped: ((Int, String) -> Void)?
    public var cellItems: [RecipeSmallCellProtocol]
    public var didSelectRecipe: IntClosure?
    
    init(category: MainCategory) {
        let cellItems = category.recipes.map({ FavoritesRecipeCellModel(recipe: $0) })
        self.categoryId = category.id
        self.categoryImageURL = nil
        self.categoryName = category.name
        self.cellItems = cellItems
    }
}
