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
}

protocol RecipesViewProtocol: RecipesViewDataSource, RecipesViewEventSource {
    
}

final class RecipesViewModel: BaseViewModel<RecipesRouter>, RecipesViewProtocol {
    var cellItems: [RecipeCellProtocol] = []
 
    var numberOfItems: Int {
        return cellItems.count
    }
    
    func cellItem(for indexPath: IndexPath) -> RecipeCellProtocol {
        let item = cellItems[indexPath.row]
        return item
    }
    
    func addDummyData() {
        let data = RecipeCellModel(id: 1,
                                   userImageUrl: nil,
                                   username: "mrtcelebi",
                                   userRecipeAndFollowerCountText: "10 Tarif 5 Takipçi",
                                   recipeTitle: "Makarna Tarifi",
                                   categoryName: "Hamur İşi",
                                   recipeImageUrl: nil,
                                   recipeCommnetAndLikeCountText: "4 Yorum 2 beğeni",
                                   isEditorChoice: true)
        
        cellItems.append(data)
    }
}
