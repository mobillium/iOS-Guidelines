//
//  CommentEditRoute.swift
//  SampleProject
//
//  Created by Murat Celebi on 31.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

protocol CommentEditRoute {
    func pushCommentEdit(recipeId: Int, commentId: Int, commentText: String?, editCommentDidSuccess: StringClosure?)
}

extension CommentEditRoute where Self: RouterProtocol {
    
    func pushCommentEdit(recipeId: Int, commentId: Int, commentText: String?, editCommentDidSuccess: StringClosure?) {
        let router = CommentEditRouter()
        let viewModel = CommentEditViewModel(recipeId: recipeId, commentId: commentId, commentText: commentText, router: router)
        let viewController = CommentEditViewController(viewModel: viewModel)
        viewModel.editCommentDidSuccess = editCommentDidSuccess
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
