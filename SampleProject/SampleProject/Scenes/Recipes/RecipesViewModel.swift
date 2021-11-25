//
//  RecipesViewModel.swift
//  SampleProject
//
//  Created by Burak Kaya on 15.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

protocol RecipesViewDataSource {
    var cellItemsPublisher: CurrentValueSubject<[RecipeCellProtocol], Never> { get }
    var numberOfItems: Int { get }
    
    func cellItem(for indexPath: IndexPath) -> RecipeCellProtocol
}

protocol RecipesViewEventSource {}

protocol RecipesViewProtocol: RecipesViewDataSource, RecipesViewEventSource {
    func fetchRecipesListingType()
    func didSelectRecipe(at indexPath: IndexPath)
    func fetchMorePages()
}

final class RecipesViewModel: BaseViewModel<RecipesRouter>, ObservableObject, RecipesViewProtocol {
    
    enum RecipesListingType {
        case editorChoiceRecipes
        case lastAddedRecipes
        case categoryRecipes(categoryId: Int)
    }
    
    var isRequestEnabled = false
    var isPagingEnabled = false
    
    var page = 1
    var cellItemsPublisher = CurrentValueSubject<[RecipeCellProtocol], Never>([])
    
    var didSuccessFetchRecipes: VoidClosure?
    private var recipesListingType: RecipesListingType
    var title: String?
    
    init(recipesListingType: RecipesListingType, router: RecipesRouter) {
        self.recipesListingType = recipesListingType
        super.init(router: router)
    }
    
    var numberOfItems: Int {
        return cellItemsPublisher.value.count
    }
    
    func cellItem(for indexPath: IndexPath) -> RecipeCellProtocol {
        let item = cellItemsPublisher.value[indexPath.row]
        return item
    }
}

// MARK: - Actions
extension RecipesViewModel {
    
    func didSelectRecipe(at indexPath: IndexPath) {
        let recipeId = cellItemsPublisher.value[indexPath.row].recipeId
        router.pushRecipeDetail(recipeId: recipeId)
    }
}

// MARK: - Network
extension RecipesViewModel {
    
    func fetchRecipesListingType() {
        var request: GetRecipesRequest
        switch recipesListingType {
        case .editorChoiceRecipes:
            request = GetRecipesRequest(page: page, listType: .editorChoiceRecipes)
        case .lastAddedRecipes:
            request = GetRecipesRequest(page: page, listType: .lastAddedRecipes)
        case .categoryRecipes(let categoryId):
            request = GetRecipesRequest(page: page, listType: .categoryRecipes(categoryId: categoryId))
        }
        self.isRequestEnabled = false
        if page == 1 { showActivityIndicatorView?() }
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            self.isRequestEnabled = true
            switch result {
            case .success(let response):
                let cellItems = response.data.map({ RecipeCellModel(recipe: $0) })
                self.cellItemsPublisher.value.append(contentsOf: cellItems)
                self.page += 1
                self.isPagingEnabled = response.pagination.currentPage < response.pagination.lastPage
            case .failure(let error):
                if self.page == 1 { self.showWarningToast?("\(error.localizedDescription) Lütfen ekranı yukarıdan aşağıya kaydırarak yenileyiniz.") }
            }
        }
    }
  
    func fetchMorePages() {
        fetchRecipesListingType()
    }
}
