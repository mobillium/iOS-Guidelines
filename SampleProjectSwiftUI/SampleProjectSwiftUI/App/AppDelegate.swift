//
//  AppDelegate.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 11.09.2025.
//

import DataProvider
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate, UISceneDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        DataProvider.apiBaseUrl = AppConfig.apiBaseURL
        return true
    }
}
