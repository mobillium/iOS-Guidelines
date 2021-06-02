//
//  RecipeDetailViewModel.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol RecipeDetailViewDataSource {
    var username: String? { get }
    var recipeAndFollowerCountText: String? { get }
    var ingredients: String? { get }
    var numberOfPeople: String? { get }
    var steps: String? { get }
    var time: String? { get }
    var reloadData: VoidClosure? { get set }

    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> CommentCellProtocol
}

protocol RecipeDetailViewEventSource {}

protocol RecipeDetailViewProtocol: RecipeDetailViewDataSource, RecipeDetailViewEventSource {
    func getRecipeComment(_ recipeId: Int)
}

final class RecipeDetailViewModel: BaseViewModel<RecipeDetailRouter>, RecipeDetailViewProtocol {
    
    var username: String?
    var recipeAndFollowerCountText: String?
    var ingredients: String?
    var numberOfPeople: String?
    var steps: String?
    var time: String?
    var reloadData: VoidClosure?
    private let recipeId: Int
    
    init(recipeId: Int, router: RecipeDetailRouter) {
        self.recipeId = recipeId
        super.init(router: router)
    }
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> CommentCellProtocol {
        return cellItems[indexPath.row]
    }
    
    var cellItems: [CommentCellProtocol] = []
    
    func getRecipeComment(_ recipeId: Int) {
        dataProvider.request(for: RecipeCommentRequest(recipedId: recipeId)) { [weak self] result in
            switch result {
            case .success(let response):
                guard let self = self else { return }
                response.data.forEach { comment in
                    self.cellItems.append(CommentCellModel(userId: comment.user!.id,
                                                           imageUrl: comment.user?.image?.url,
                                                           username: comment.user?.username,
                                                           recipeAndFollowerCountText: "\(comment.user?.recipeCount ?? 0) Tarif \(comment.user?.followedCount ?? 0) Takipçi",
                                                           timeDifferenceText: comment.difference,
                                                           commentId: comment.id,
                                                           commentText: comment.text))
                }
                self.reloadData?()
            case .failure(_ ):
                self?.reloadData?()
            }
        }
    }
    
}
