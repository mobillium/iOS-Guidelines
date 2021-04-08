//
//  AppRouter.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit
import MobilliumUserDefaults

final class AppRouter: Router, AppRouter.Routes {
    
    typealias Routes = HomeRoute & WalkThroughRoute
    
    static let shared = AppRouter()
    
    func startApp() {
        if DefaultsKey.isWalkThroughCompleted.value == true {
            placeOnWindowHome()
        } else {
            placeOnWindowWalkThrough()
        }
    }
    
}
