//
//  RecipeHeaderViewModel.swift
//  SampleProject
//
//  Created by Emirhan Battalbaş on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

protocol RecipeHeaderViewDataSource {
    func numberOfItemsAt() -> Int
    func cellItemAt(indexPath: IndexPath) -> RecipeHeaderCellProtocol
}

protocol RecipeHeaderViewEventSource {}

protocol RecipeHeaderViewProtocol: RecipeHeaderViewDataSource, RecipeHeaderViewEventSource {
    func didSelectItem(indexPath: IndexPath)
}

final class RecipeHeaderViewModel: BaseViewModel<RecipeHeaderRouter>, RecipeHeaderViewProtocol {

    private let recipeHeaderData: [RecipeHeaderCellProtocol]

    init(router: RecipeHeaderRouter, recipeHeaderData: [RecipeHeaderCellProtocol]) {
        self.recipeHeaderData = recipeHeaderData
        super.init(router: router)
    }

    func numberOfItemsAt() -> Int {
        return recipeHeaderData.count
    }

    func cellItemAt(indexPath: IndexPath) -> RecipeHeaderCellProtocol {
        return recipeHeaderData[indexPath.row]
    }

    func didSelectItem(indexPath: IndexPath) {
        let photos = recipeHeaderData.map { $0.imageUrl }
        AppRouter.shared.presentSKPhotoBrowser(with: photos, initialPageIndex: indexPath.row)
    }
    
}
