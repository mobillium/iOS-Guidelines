//
//  CategoryCellViiewModel+Extension.swift
//  Fodamy
//
//  Created by Catalina on 12.01.2021.
//

import Foundation

extension CategoryWithRecipesCellModel {
    
    convenience init(category: MainCategory) {
        let cellItems = category.recipes.map({ RecipeCellModel(recipe: $0) })
        self.init(categoryId: category.id, categoryImageURL: nil, categoryName: category.name, cellItems: cellItems)
    }
}  
