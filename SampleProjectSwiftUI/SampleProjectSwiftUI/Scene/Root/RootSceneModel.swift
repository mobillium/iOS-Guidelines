//
//  RootSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 13.10.2022.
//

import Combine

class RootSceneModel: BaseSceneModel {
    
    static let shared = RootSceneModel()
    
    @Published var state: State = .splash(viewModel: SplashSceneModel())
    
    enum State {
        case splash(viewModel: SplashSceneModel)
        case onboarding(viewModel: OnboardingSceneModel)
    }
}
