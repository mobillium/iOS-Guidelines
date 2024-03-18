//
//  BaseScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 15.09.2022.
//

import Components
import SwiftUI

struct BaseScene<Content: View, ViewModel: BaseSceneModel>: View {
    
    let content: Content
    @ObservedObject var viewModel: ViewModel
    
    init(@ViewBuilder content: () -> Content, viewModel: ViewModel) {
        self.content = content()
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            ZStack {
                content
                if viewModel.showLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                
                if viewModel.showTryAgainButton {
                    Button("Try Again", action: self.viewModel.tryAgainButtonAction)
                        .foregroundColor(.black)
                }
            }
            .fullScreenCover(isPresented: $viewModel.showFullScreenLoading) {
                FullScreenLoadingView()
            }
        }
    }
}

#Preview {
    let viewModel = BaseSceneModel(dataProvider: apiDataProvider)
    return BaseScene(content: {
        
    }, viewModel: viewModel)
}
