//
//  RecipeDetailRouter.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

final class RecipeDetailRouter: Router, RecipeDetailRouter.Routes {
    typealias Routes = LoginWarningPopupRoute & LoginRoute & UnfollowAlertViewRoute & CommentListRoute
}
