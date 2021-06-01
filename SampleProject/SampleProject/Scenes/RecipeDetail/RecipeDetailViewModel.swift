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
    var userImageUrl: String? { get }
    var recipeName: String? { get }
    var categoryName: String? { get }
    var timeDifferenceText: String? { get }
    var recipeAndFollowerCountText: String? { get }
    var ingredients: String? { get }
    var numberOfPeople: String? { get }
    var steps: String? { get }
    var time: String? { get }
    var commentCount: Int? { get }
    var likeCount: Int? { get }
    var reloadData: VoidClosure? { get set }
    var reloadDetailData: VoidClosure? { get set }
    
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> CommentCellProtocol
}

protocol RecipeDetailViewEventSource {}

protocol RecipeDetailViewProtocol: RecipeDetailViewDataSource, RecipeDetailViewEventSource {
    func getRecipeComment(_ recipeId: Int)
    func getRecipeDetail(_ recipeId: Int)
}

final class RecipeDetailViewModel: BaseViewModel<RecipeDetailRouter>, RecipeDetailViewProtocol {
    
    var username: String?
    var userImageUrl: String?
    var recipeName: String?
    var categoryName: String?
    var timeDifferenceText: String?
    var recipeAndFollowerCountText: String?
    var ingredients: String?
    var numberOfPeople: String?
    var steps: String?
    var time: String?
    var commentCount: Int?
    var likeCount: Int?
    var reloadData: VoidClosure?
    var reloadDetailData: VoidClosure?
    private let recipeId: Int
    
    var recipeHeaderCellItems: [RecipeHeaderCellProtocol] = []
    
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
    
}

// MARK: - Network
extension RecipeDetailViewModel {
    
    func getRecipeComment(_ recipeId: Int) {
        dataProvider.request(for: RecipeCommentRequest(recipedId: recipeId)) { [weak self] result in
            switch result {
            case .success(let response):
                guard let self = self else { return }
                response.data.forEach { comment in
                    self.cellItems.append(CommentCellModel(userId: comment.user!.id,
                                                           imageUrl: nil,
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
    
    func getRecipeDetail(_ recipeId: Int) {
        dataProvider.request(for: GetRecipeDetailRequest(recipeId: recipeId)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.username = response.user.username
                self.userImageUrl = response.user.image?.url
                self.recipeName = response.title
                self.categoryName = response.category.name
                self.timeDifferenceText = response.timeDifference
                self.recipeAndFollowerCountText = "\(response.user.recipeCount) Tarif \(response.user.followingCount) Takipçi"
                self.ingredients = response.ingredients
                self.numberOfPeople = response.numberOfPerson.text
                self.steps = response.instructions
                self.time = response.timeOfRecipe.text
                self.commentCount = response.commentCount
                self.likeCount = response.likeCount
                response.images.forEach({ image in
                    self.recipeHeaderCellItems.append(RecipeHeaderCellModel(imageUrl: image.url ?? ""))
                })
                
                self.reloadDetailData?()
            case .failure(let error ):
                print(error.localizedDescription)
            }
        }
    }
    
}
