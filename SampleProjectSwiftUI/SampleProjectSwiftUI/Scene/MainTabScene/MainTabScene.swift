//
//  MainTabScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 20.10.2022.
//

import Combine
import SwiftUI

struct MainTabScene<ViewModel: MainTabSceneModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        TabView {
            HomeScene(viewModel: HomeSceneModel())
                .tabItem {
                    Image("ic_home")
                        .renderingMode(.template)
                        .foregroundColor(.appCinder)
                }
                .tag(0)
            
            FavoritesScene(viewModel: FavoritesSceneModel())
                .tabItem {
                    Image("ic_heart")
                        .renderingMode(.template)
                        .foregroundColor(.appCinder)
                }
                .tag(1)
        }
        .accentColor(.appRed)
    }
}

struct MainTabScene_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainTabSceneModel()
        return MainTabScene(viewModel: viewModel)
    }
}
