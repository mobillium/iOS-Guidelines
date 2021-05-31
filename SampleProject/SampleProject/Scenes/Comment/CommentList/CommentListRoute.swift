//
//  CommentListRoute.swift
//  SampleProject
//
//  Created by Murat Celebi on 31.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

protocol CommentListRoute {
    func pushCommentList(recipeId: Int)
    func placeOnCommentList(recipeId: Int)
}

extension CommentListRoute where Self: RouterProtocol {
    
    func pushCommentList(recipeId: Int) {
        let router = CommentListRouter()
        let viewModel = CommentListViewModel(recipeId: recipeId, router: router)
        let viewController = CommentListViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
    
    func placeOnCommentList(recipeId: Int) {
        let router = CommentListRouter()
        let viewModel = CommentListViewModel(recipeId: recipeId, router: router)
        let viewController = CommentListViewController(viewModel: viewModel)
        let navController = MainNavigationController(rootViewController: viewController)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navController, transition: transition)
    }
}
