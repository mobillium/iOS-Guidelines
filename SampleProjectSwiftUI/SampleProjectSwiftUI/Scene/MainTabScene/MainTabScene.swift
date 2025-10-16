//
//  MainTabScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 20.10.2022.
//

import Combine
import SwiftUI
import Components

struct MainTabScene<ViewModel: MainTabSceneModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        setupAppearance()
    }
    
    var body: some View {
        TabView {
            HomeScene(viewModel: HomeSceneModel())
                .tabItem {
                    Image("ic_home")
                        .renderingMode(.template)
                        .foregroundColor(.appFocus)
                }
                .tag(0)
            
            FavoritesScene(viewModel: FavoritesSceneModel())
                .tabItem {
                    Image("ic_heart")
                        .renderingMode(.template)
                        .foregroundColor(.appFocus)
                }
                .tag(1)
        }
        .accentColor(.appPrimary)
    }
    
    func setupAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = Color.appPureWhite.uiColor
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    let viewModel = MainTabSceneModel()
    return MainTabScene(viewModel: viewModel)
}
