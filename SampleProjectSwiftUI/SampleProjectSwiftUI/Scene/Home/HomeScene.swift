//
//  HomeScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 20.10.2022.
//

import Combine
import SwiftUI

struct HomeScene<ViewModel: HomeSceneModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        setupAppearance()
    }
    
    var body: some View {
        NavigationView {
            BaseScene(content: {
                
            }, viewModel: viewModel)
                        
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal, content: {
                    Image("fodamy-logo")
                        .resizable()
                        .frame(width: 110, height: 30)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.appWhite)
                })
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func setupAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Color.appRed.uiColor
        appearance.titleTextAttributes = [.foregroundColor: Color.appWhite.uiColor,
                                          .font: Font.uiFont(.nunitoExtraBold, size: .medium)]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

struct HomeScene_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HomeSceneModel()
        return HomeScene(viewModel: viewModel)
    }
}
