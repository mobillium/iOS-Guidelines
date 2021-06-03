//
//  RecipeDetailViewModel.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation
import KeychainSwift

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
    var isLiked: Bool { get }
    var isFollowing: Bool { get }
    
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> CommentCellProtocol
}

protocol RecipeDetailViewEventSource {
    var toggleIsLiked: VoidClosure? { get set }
    var toggleIsFollowing: VoidClosure? { get set }
    var reloadCommentData: VoidClosure? { get set }
    var reloadDetailData: VoidClosure? { get set }
}

protocol RecipeDetailViewProtocol: RecipeDetailViewDataSource, RecipeDetailViewEventSource {
    func getRecipeComment()
    func getRecipeDetail()
    func likeButtonTapped()
    func followButtonTapped()
    func commentButtonTapped()
    func didSelectComment()
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
    var isLiked = false
    var isFollowing = false
    private let recipeId: Int
    private var followedId: Int?
    var reloadCommentData: VoidClosure?
    var reloadDetailData: VoidClosure?
    var toggleIsLiked: VoidClosure?
    var toggleIsFollowing: VoidClosure?
    
    let keychain = KeychainSwift()
    
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

// MARK: - Actions
extension RecipeDetailViewModel {
    
    func likeButtonTapped() {
        guard keychain.get(Keychain.token) != nil else {
            router.presentLoginWarningPopup(loginHandler: { [weak self] in
                self?.router.presentLogin()
            })
            return
        }
        
        recipeLikeRequest()
    }
    
    func followButtonTapped() {
        guard keychain.get(Keychain.token) != nil else {
            router.presentLoginWarningPopup(loginHandler: { [weak self] in
                self?.router.presentLogin()
            })
            return
        }
        
        switch isFollowing {
        case true:
            router.presentUnfollowAlertView {
                self.userFollowRequest(followType: .unfollow)
            }
        case false:
            userFollowRequest(followType: .follow)
        }
    }
    
    func commentButtonTapped() {
        router.pushCommentList(recipeId: recipeId, isKeyboardOpen: true)
    }
    
    func didSelectComment() {
        router.pushCommentList(recipeId: recipeId, isKeyboardOpen: false)
    }
}

// MARK: - Network
extension RecipeDetailViewModel {
    
    func getRecipeComment() {
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
                self.reloadCommentData?()
            case .failure(_ ):
                self?.reloadCommentData?()
            }
        }
    }
    
    func getRecipeDetail() {
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
                self.isLiked = response.isLiked
                self.isFollowing = response.user.isFollowing
                self.followedId = response.user.id
                response.images.forEach({ image in
                    self.recipeHeaderCellItems.append(RecipeHeaderCellModel(imageUrl: image.url ?? ""))
                })
                
                self.reloadDetailData?()
            case .failure(let error ):
                print(error.localizedDescription)
            }
        }
    }
    
    private func recipeLikeRequest() {
        let request: RecipeLikeRequest
        switch isLiked {
        case true:
            request = RecipeLikeRequest(recipeId: recipeId, likeType: .unlike)
        case false:
            request = RecipeLikeRequest(recipeId: recipeId, likeType: .like)
        }
        toggleIsLiked?()
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                print(response.message)
            case .failure(let error):
                print(error.localizedDescription)
                self.toggleIsLiked?()
            }
        }
    }
    
    private func userFollowRequest(followType: UserFollowRequest.FollowType) {
        guard let followedId = followedId else { return }
        toggleIsFollowing?()
        let request = UserFollowRequest(followedId: followedId, followType: followType)
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                print(response.message)
            case .failure(let error):
                print(error.localizedDescription)
                self.toggleIsFollowing?()
            }
        }
    }
}
