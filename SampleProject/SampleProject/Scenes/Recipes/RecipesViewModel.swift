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
 
    var recipesCellItems: [RecipeCellModel] = []
    
    var numberOfItems: Int {
        return cellItems.count
    }
    
    func cellItem(for indexPath: IndexPath) -> CategoryWithRecipesCellProtocol {
        let item = cellItems[indexPath.row]
        return item
    }
    
    func addDummyData() {
        
        for _ in 0...10 {
            let recipeCellItems = RecipeCellModel(recipeId: 1,
                                                  userId: 1,
                                                  userImageUrl: nil,
                                                  username: "mrtcelebi",
                                                  userRecipeAndFollowerCountText: "5 Tarif 3 Takipçi",
                                                  recipeTitle: "Makarna Tarifi",
                                                  categoryName: "Makarna",
                                                  recipeImageUrl: nil,
                                                  recipeCommnetAndLikeCountText: "3 Yorum 2 Beğeni",
                                                  isEditorChoice: false)
            recipesCellItems.append(recipeCellItems)
        }    
        
        for _ in 0...20 {
            
            let data = CategoryWithRecipesCellModel(categoryId: 1, categoryImageURL: nil, categoryName: "Makarna", cellItems: recipesCellItems)
            cellItems.append(data)
        }
    }
}
