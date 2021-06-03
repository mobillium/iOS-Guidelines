//
//  AppDelegate+IQKeyboardManager.swift
//  SampleProject
//
//  Created by Murat Celebi on 2.06.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import IQKeyboardManagerSwift

extension AppDelegate {
    
    func configureIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.disabledDistanceHandlingClasses.append(CommentListViewController.self)
        IQKeyboardManager.shared.disabledToolbarClasses.append(CommentListViewController.self)
        IQKeyboardManager.shared.disabledDistanceHandlingClasses.append(CommentEditViewController.self)
        IQKeyboardManager.shared.disabledToolbarClasses.append(CommentEditViewController.self)
    }
}
