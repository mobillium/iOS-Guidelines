//
//  RootSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 13.10.2022.
//

import Combine

class RootSceneModel: BaseSceneModel {
    
    static let shared = RootSceneModel(dataProvider: apiDataProvider)
    
    @Published var state: State = .splash(viewModel: SplashSceneModel(dataProvider: apiDataProvider))
    
    enum State {
        case splash(viewModel: SplashSceneModel)
        case onboarding(viewModel: OnboardingSceneModel)
        case mainTab(viewModel: MainTabSceneModel)
    }
}
