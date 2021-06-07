//
//  UnfollowAlertViewRoute.swift
//  SampleProject
//
//  Created by Murat Celebi on 01.06.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

protocol UnfollowAlertViewRoute {
    func presentUnfollowAlertView(unFollowAction: VoidClosure?)
}

extension UnfollowAlertViewRoute where Self: RouterProtocol {
    
    func presentUnfollowAlertView(unFollowAction: VoidClosure?) {
        let transition = ModalTransition()
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let unFollowAction = UIAlertAction(title: "Takibi Bırak", style: .destructive) {_ in 
            unFollowAction?()
        }
        let dismissAction = UIAlertAction(title: "İptal", style: .cancel, handler: nil)
        
        alert.addAction(unFollowAction)
        alert.addAction(dismissAction)
        
        open(alert, transition: transition)
    }
}
