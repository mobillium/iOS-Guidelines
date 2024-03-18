//
//  SplashScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 15.09.2022.
//

import SwiftUI

struct SplashScene<ViewModel: SplashSceneModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        BaseScene(content: {
            
            Color.appRed
                .ignoresSafeArea()
            
            Image("fodamy-logo")
                .padding([.leading, .trailing], 64)
                .foregroundColor(.appWhite)
            
        }, viewModel: viewModel)
        .onAppear {
            viewModel.checkState()
        }
    }
}

#Preview {
    let viewModel = SplashSceneModel(dataProvider: apiDataProvider)
    let view = SplashScene(viewModel: viewModel)
    return view
}
