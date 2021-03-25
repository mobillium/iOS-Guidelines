//
//  RecipesViewModel.swift
//  Fodamy
//
//  Created by Catalina on 7.01.2021.
//

import UIKit

protocol RecipesViewDataSource: AnyObject {
    var numberOfItems: Int { get }
    
    func cellItem(for indexPath: IndexPath) -> CategoryWithRecipesCellProtocol
}

protocol RecipesViewEventSource: AnyObject {
}

protocol RecipesViewProtocol: RecipesViewDataSource, RecipesViewEventSource {
    
}

final class RecipesViewModel: BaseViewModel<RecipesRouter>, RecipesViewProtocol {
    var cellItems: [CategoryWithRecipesCellProtocol] = []
 
    var numberOfItems: Int {
        return cellItems.count
    }
    
    func cellItem(for indexPath: IndexPath) -> CategoryWithRecipesCellProtocol {
        let item = cellItems[indexPath.row]
        return item
    }
    
    func addDummyData() {
        for _ in 0...20 {
            let data = CategoryWithRecipesCellModel(categoryId: 1, categoryImageURL: nil, categoryName: "Makarna")
            cellItems.append(data)
        }
    }
}
