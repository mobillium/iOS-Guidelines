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
    var userId: Int? { get }
    var userImageUrl: String? { get }
    var userFollowedCount: Int? { get }
    var recipeName: String? { get }
    var recipeCount: Int? { get }
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
    func shareBarButtonTapped()
}

final class RecipeDetailViewModel: BaseViewModel<RecipeDetailRouter>, RecipeDetailViewProtocol {
    
    var username: String?
    var userId: Int?
    var userImageUrl: String?
    var recipeName: String?
    var recipeCount: Int?
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
    
    var userFollowedCount: Int? {
        didSet {
            recipeAndFollowerCountText = "\(recipeCount ?? 0) \(L10n.General.recipe) \(userFollowedCount ?? 0) \(L10n.General.follower)"
        }
    }
    
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
    
    func resetData() {
        cellItems.removeAll()
        recipeHeaderCellItems.removeAll()
    }
    
    func shareBarButtonTapped() {
        let title = recipeName
        let imageUrlString = userImageUrl
        guard let imageUrl = URL(string: imageUrlString ?? "") else { return }
        let items: [Any] = [title ?? "", imageUrl]
        router.presentShareSheet(items: items)
    }
}

// MARK: - Network
// swiftlint:disable line_length
extension RecipeDetailViewModel {
    
    func getRecipeComment() {
        let request = GetRecipeCommentsRequest(recipeId: recipeId)
        dataProvider.request(for: request) { [weak self] result in
            switch result {
            case .success(let response):
                guard let self = self else { return }
                let cellItems = response.data.map({ CommentCellModel(comment: $0) })
                self.cellItems = cellItems
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
            case .success(let recipeDetail):
                self.setData(recipeDetail: recipeDetail)
                self.reloadDetailData?()
            case .failure(let error ):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setData(recipeDetail: RecipeDetail) {
        username = recipeDetail.user.username
        userId = recipeDetail.user.id
        userImageUrl = recipeDetail.user.image?.url
        userFollowedCount = recipeDetail.user.followedCount
        recipeName = recipeDetail.title
        recipeCount = recipeDetail.user.recipeCount
        categoryName = recipeDetail.category.name
        timeDifferenceText = recipeDetail.timeDifference
        recipeAndFollowerCountText = "\(recipeCount ?? 0) \(L10n.General.recipe) \(userFollowedCount ?? 0) \(L10n.General.follower)"
        ingredients = recipeDetail.ingredients
        numberOfPeople = recipeDetail.numberOfPerson.text
        steps = recipeDetail.instructions
        time = recipeDetail.timeOfRecipe.text
        commentCount = recipeDetail.commentCount
        likeCount = recipeDetail.likeCount
        isLiked = recipeDetail.isLiked
        isFollowing = recipeDetail.user.isFollowing
        followedId = recipeDetail.user.id
        recipeDetail.images.forEach({ image in
            recipeHeaderCellItems.append(RecipeHeaderCellModel(imageUrl: image.url ?? "", isEditorChoice: recipeDetail.isEditorChoice))
        })
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
// swiftlint:enable line_length
