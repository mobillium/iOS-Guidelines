//
//  RecipeHeaderViewModel.swift
//  SampleProject
//
//  Created by Emirhan Battalbaş on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import SKPhotoBrowser

protocol RecipeHeaderViewDataSource {
    func numberOfItemsAt() -> Int
    func cellItemAt(indexPath: IndexPath) -> RecipeHeaderCellProtocol
    func convertImageToSKPhoto() -> [SKPhotoProtocol]
}

protocol RecipeHeaderViewEventSource {}

protocol RecipeHeaderViewProtocol: RecipeHeaderViewDataSource, RecipeHeaderViewEventSource {}

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

    func convertImageToSKPhoto() -> [SKPhotoProtocol] {
        return recipeHeaderData.map { SKPhoto.photoWithImageURL($0.imageUrl) }
    }

}
