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
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        setupAppearance()
    }
    
    var body: some View {
        TabView {
            HomeScene(viewModel: HomeSceneModel(dataProvider: apiDataProvider))
                .tabItem {
                    Image("ic_home")
                        .renderingMode(.template)
                        .foregroundColor(.appCinder)
                }
                .tag(0)
            
            FavoritesScene(viewModel: FavoritesSceneModel(dataProvider: apiDataProvider))
                .tabItem {
                    Image("ic_heart")
                        .renderingMode(.template)
                        .foregroundColor(.appCinder)
                }
                .tag(1)
        }
        .accentColor(.appRed)
    }
    
    func setupAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = Color.appWhite.uiColor
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    let viewModel = MainTabSceneModel(dataProvider: apiDataProvider)
    return MainTabScene(viewModel: viewModel)
}
