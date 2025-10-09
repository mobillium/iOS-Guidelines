//
//  SplashSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 15.09.2022.
//

import MobilliumUserDefaults

class SplashSceneModel: BaseSceneModel {
    func checkState() {
        if DefaultsKey.isFirstStart.has {
            let viewModel = MainTabSceneModel()
            RootSceneModel.shared.state = .mainTab(viewModel: viewModel)
        } else {
            let viewModel = OnboardingSceneModel()
            RootSceneModel.shared.state = .onboarding(viewModel: viewModel)
        }
        
    }
}
