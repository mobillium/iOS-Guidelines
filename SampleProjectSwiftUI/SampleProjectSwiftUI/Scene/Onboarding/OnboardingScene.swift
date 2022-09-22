//
//  OnboardingScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 22.09.2022.
//

import SwiftUI

struct OnboardingScene<ViewModel: OnboardingSceneModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            LazyHStack {
                TabView {
                    ForEach(viewModel.items) { viewModel in
                        OnboardingView(viewModel: viewModel)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .frame(width: UIScreen.main.bounds.width)
                .frame(height: UIScreen.main.bounds.height)
            }
        }

    }
}

struct OnboardingScene_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = OnboardingSceneModel()
        return OnboardingScene(viewModel: viewModel)
    }
}
