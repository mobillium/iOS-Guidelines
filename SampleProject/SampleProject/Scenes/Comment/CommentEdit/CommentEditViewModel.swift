//
//  CommentEditViewModel.swift
//  SampleProject
//
//  Created by Murat Celebi on 31.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol CommentEditViewDataSource {
    var title: String { get }
    var commentText: String? { get }
}

protocol CommentEditViewEventSource {
    var editCommentDidSuccess: StringClosure? { get set }
}

protocol CommentEditViewProtocol: CommentEditViewDataSource, CommentEditViewEventSource {
    func editComment(commentText: String)
}

final class CommentEditViewModel: BaseViewModel<CommentEditRouter>, CommentEditViewProtocol {
    
    let title = L10n.Modules.CommentEditController.title
    private let recipeId: Int
    private let commentId: Int
    let commentText: String?
    var editCommentDidSuccess: StringClosure?
    
    init(recipeId: Int, commentId: Int, commentText: String?, router: CommentEditRouter) {
        self.recipeId = recipeId
        self.commentId = commentId
        self.commentText = commentText
        super.init(router: router)
    }
}

// MARK: - Network
extension CommentEditViewModel {
    
    func editComment(commentText: String) {
        showLoading?()
        let request = EditRecipeCommentRequest(recipeId: recipeId, commentId: commentId, commentText: commentText)
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(_):
                self.editCommentDidSuccess?(commentText)
                self.router.close()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
