//
//  MainTabBarRoute.swift
//  SampleProject
//
//  Created by Murat Celebi on 28.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

protocol MainTabBarRoute {
    func placeOnWindowMainTabBarController()
}

extension MainTabBarRoute where Self: RouterProtocol {
    
    func placeOnWindowMainTabBarController() {
        let mainTabBarController = MainTabBarController()
        let transition = PlaceOnWindowTransition()
        
        open(mainTabBarController, transition: transition)
    }
}
