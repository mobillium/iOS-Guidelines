//
//  SampleProjectSwiftUIApp.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 15.09.2022.
//

import SwiftUI

@main
struct SampleProjectSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = SplashSceneModel()
            SplashScene(viewModel: viewModel)
        }
    }
}
