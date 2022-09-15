//
//  SplashScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 15.09.2022.
//

import SwiftUI

struct SplashScene<ViewModel: SplashSceneModel>: View {
    
    @ObservedObject var viewModel: SplashSceneModel
    
    var body: some View {
        BaseScene(content: {
            
        }, viewModel: viewModel)
    }
}

struct SplashScene_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SplashSceneModel()
        viewModel.showLoading = true
        return SplashScene(viewModel: viewModel)
    }
}
