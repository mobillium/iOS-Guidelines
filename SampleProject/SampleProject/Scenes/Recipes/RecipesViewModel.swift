//
//  RecipesViewModel.swift
//  Fodamy
//
//  Created by Catalina on 7.01.2021.
//

import UIKit

protocol RecipesViewDataSource: AnyObject {
    var numberOfItems: Int { get }
    
    func cellItem(for indexPath: IndexPath) -> RecipeCellProtocol
}

protocol RecipesViewEventSource: AnyObject {
    var didSuccessFetchRecipes: VoidClosure? { get set }
}

protocol RecipesViewProtocol: RecipesViewDataSource, RecipesViewEventSource {
    
}

final class RecipesViewModel: BaseViewModel<RecipesRouter>, RecipesViewProtocol {
    
    enum RecipesListingType {
        case editorChoiceRecipes
        case lastAddedRecipes
        case categoryRecipes(categoryId: Int)
    }
    
    var isRequestEnabled = false
    var isPagingEnabled = false
    
    var page = 1
    var cellItems: [RecipeCellProtocol] = []
  
    var didSuccessFetchRecipes: VoidClosure?
    private var recipesListingType: RecipesListingType
    var title: String?
    
    init(recipesListingType: RecipesListingType, router: RecipesRouter) {
        self.recipesListingType = recipesListingType
        super.init(router: router)
    }
    
    var numberOfItems: Int {
        return cellItems.count
    }
    
    func cellItem(for indexPath: IndexPath) -> RecipeCellProtocol {
        let item = cellItems[indexPath.row]
        return item
    }
}
