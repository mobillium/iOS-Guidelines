//
//  AppRouter.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Foundation
import UIKit
import SKPhotoBrowser
import MobilliumUserDefaults

final class AppRouter: Router, AppRouter.Routes {
    
    typealias Routes = HomeRoute & WalkThroughRoute & SKPhotoBrowserRoute
    
    static let shared = AppRouter()
    
    func startApp() {
        if DefaultsKey.isWalkThroughCompleted.value == true {
            placeOnWindowHome()
        } else {
            placeOnWindowWalkThrough()
        }
    }

    func presentSKPhotoBrowser(with photos: [String], delegate: PhotoBrowserDelegate, initialPageIndex: Int = 0) {
        guard let topVC = topViewController() else { return }
        presentSKPhotoBrowser(with: photos, viewController: topVC, initialPageIndex: initialPageIndex, delegate: delegate)
    }

    private func topViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
}
