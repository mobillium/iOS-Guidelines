//
//  RecipesViewModel.swift
//  Fodamy
//
//  Created by Catalina on 7.01.2021.
//

import UIKit

protocol RecipesViewDataSource: AnyObject {
    var numberOfItems: Int { get }
    
    func cellItem(for indexPath: IndexPath) -> CommentCellProtocol
}

protocol RecipesViewEventSource: AnyObject {
}

protocol RecipesViewProtocol: RecipesViewDataSource, RecipesViewEventSource {
    
}

final class RecipesViewModel: BaseViewModel<RecipesRouter>, RecipesViewProtocol {
    var cellItems: [CommentCellProtocol] = []
 
    
    var numberOfItems: Int {
        return cellItems.count
    }
    
    func cellItem(for indexPath: IndexPath) -> CommentCellProtocol {
        let item = cellItems[indexPath.row]
        return item
    }
    
    func addDummyData() {
        
        for _ in 0...20 {
            
            let data = CommentCellModel(userId: 1,
                                        imageUrl: nil,
                                        username: "mrtcelebi",
                                        recipeAndFollowerCountText: "5 Tarif 2 Takipçi",
                                        timeDifferenceText: "3 dakika önce",
                                        commentId: 2,
                                        commentText: "Merhaba ellerinize sağlık çok güzel olmuş")
            cellItems.append(data)
        }
    }
}
