//
//  RecipeHeaderViewModel.swift
//  SampleProject
//
//  Created by Emirhan Battalbaş on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol RecipeHeaderViewDataSource {
    var recipeHeaderData: [RecipeHeaderCellProtocol] { get set }
}

protocol RecipeHeaderViewEventSource {}

protocol RecipeHeaderViewProtocol: RecipeHeaderViewDataSource, RecipeHeaderViewEventSource {}

final class RecipeHeaderViewModel: BaseViewModel<RecipeHeaderRouter>, RecipeHeaderViewProtocol {
    var recipeHeaderData: [RecipeHeaderCellProtocol]

    init(router: RecipeHeaderRouter, recipeHeaderData: [RecipeHeaderCellProtocol]) {
        self.recipeHeaderData = recipeHeaderData
        super.init(router: router)
    }

}
