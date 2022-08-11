//
//  CommentListRouter.swift
//  SampleProject
//
//  Created by Murat Celebi on 31.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

final class CommentListRouter: Router, CommentListRouter.Routes {
    typealias Routes = LoginWarningPopupRoute &
        LoginRoute &
        CommentEditDeleteAlertViewRoute &
        CommentEditRoute
}
