//
//  RootScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 13.10.2022.
//

import Combine
import SwiftUI

struct RootScene<ViewModel: RootSceneModel>: View {
    
    @StateObject var viewModel = RootSceneModel.shared
    
    var body: some View {
        ZStack {
            Group {
                switch viewModel.state {
                case .splash(let viewModel):
                    SplashScene(viewModel: viewModel)
                case .onboarding(let viewModel):
                    OnboardingScene(viewModel: viewModel)
                case .mainTab(let viewModel):
                    MainTabScene(viewModel: viewModel)
                }
            }
            
        }

    }
}

struct RootScene_Previews: PreviewProvider {
    static var previews: some View {
        let view = RootScene()
        return view
    }
}
