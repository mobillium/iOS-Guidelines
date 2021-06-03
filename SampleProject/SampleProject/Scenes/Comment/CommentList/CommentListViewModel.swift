//
//  CommentListViewModel.swift
//  SampleProject
//
//  Created by Murat Celebi on 31.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation
import KeychainSwift

protocol CommentListViewDataSource {
    var title: String { get }
    
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> CommentCellProtocol
}

protocol CommentListViewEventSource {
    var reloadData: VoidClosure? { get set }
    var postCommentDidSuccess: VoidClosure? { get set }
    var deleteCommentDidSuccess: IndexPathClosure? { get set }
}

protocol CommentListViewProtocol: CommentListViewDataSource, CommentListViewEventSource {
    func sendButtonTapped(commentText: String)
    func moreButtonTapped(at indexPath: IndexPath)
    func fetchComments()
    func fetchMorePages()
}

final class CommentListViewModel: BaseViewModel<CommentListRouter>, CommentListViewProtocol {
    
    let title = L10n.Modules.CommentListController.title
    private let recipeId: Int
    private let keychain = KeychainSwift()
    var reloadData: VoidClosure?
    var postCommentDidSuccess: VoidClosure?
    var deleteCommentDidSuccess: IndexPathClosure?
    
    var isRequestEnabled = false
    var isPagingEnabled = false
    private var page = 1
    
    init(recipeId: Int, router: CommentListRouter) {
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
extension CommentListViewModel {
    
    func sendButtonTapped(commentText: String) {
        guard keychain.get(Keychain.token) != nil else {
            router.presentLoginWarningPopup(loginHandler: { [weak self] in
                self?.router.presentLogin()
            })
            return
        }
        postRecipeComment(commentText: commentText)
    }
    
    func moreButtonTapped(at indexPath: IndexPath) {
        router.presentCommentEditDeleteAlertView(edit: { [weak self] in
            self?.editCommentButtonTapped(indexPath: indexPath)
        }, delete: { [weak self] in
            self?.deleteCommentRequest(indexPath: indexPath)
        })
    }
    
    private func editCommentButtonTapped(indexPath: IndexPath) {
        let viewModel = cellItems[indexPath.row]
        let commentId = viewModel.commentId
        let commentText = viewModel.commentText
        
        let editCommentDidSuccess: StringClosure = { [weak self] text in
            viewModel.commentText = text
            viewModel.commentTextDidChanged?()
            self?.reloadData?()
            
        }
        
        router.pushCommentEdit(recipeId: recipeId,
                               commentId: commentId,
                               commentText: commentText,
                               editCommentDidSuccess: editCommentDidSuccess)
    }
}

// MARK: - Network
extension CommentListViewModel {
    
    func fetchComments() {
        self.isRequestEnabled = false
        if page == 1 { showActivityIndicatorView?() }
        let request = GetRecipeCommentsRequest(recipeId: recipeId, page: page)
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            self.isRequestEnabled = true
            switch result {
            case .success(let response):
                self.cellItems.removeAll()
                response.data.forEach({ comment in
                    self.cellItems.append(CommentCellModel(userId: comment.user.id,
                                                           imageUrl: comment.user.image?.url,
                                                           username: comment.user.username,
                                                           recipeAndFollowerCountText: "\(comment.user.recipeCount) Tarif \(comment.user.followedCount) Takipçi",
                                                           timeDifferenceText: comment.timeDifference,
                                                           commentId: comment.id,
                                                           commentText: comment.text))
                })
                self.isPagingEnabled = response.pagination.currentPage < response.pagination.lastPage
                if self.isPagingEnabled { self.page += 1 }
                self.reloadData?()
            case .failure(_ ):
                if self.page == 1 { self.showWarningToast?(L10n.Error.refresh) }
            }
        }
    }
    
    private func deleteCommentRequest(indexPath: IndexPath) {
        let commentId = cellItems[indexPath.row].commentId
        showLoading?()
        let request = DeleteRecipeCommentRequest(recipeId: recipeId, commentId: commentId)
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(_):
                self.cellItems.remove(at: indexPath.row)
                self.deleteCommentDidSuccess?(indexPath)
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    private func postRecipeComment(commentText: String) {
        showLoading?()
        let request = PostRecipeCommentRequest(recipeId: recipeId, commentText: commentText)
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                debugPrint(response)
                self.fetchComments()
                self.postCommentDidSuccess?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    func fetchMorePages() {
        fetchComments()
    }
}
