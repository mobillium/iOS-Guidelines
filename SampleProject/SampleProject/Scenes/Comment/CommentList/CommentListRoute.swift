//
//  CommentListRoute.swift
//  SampleProject
//
//  Created by Murat Celebi on 31.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

protocol CommentListRoute {
    func pushCommentList(recipeId: Int, isKeyboardOpen: Bool?)
}

extension CommentListRoute where Self: RouterProtocol {
    
    func pushCommentList(recipeId: Int, isKeyboardOpen: Bool?) {
        let router = CommentListRouter()
        let viewModel = CommentListViewModel(recipeId: recipeId, router: router)
        let viewController = CommentListViewController(viewModel: viewModel)
        viewController.isKeyboardOpen = isKeyboardOpen ?? false
        viewController.hidesBottomBarWhenPushed = true
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
