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
                    Image(systemName: "house")
                        .environment(\.symbolVariants, .none)
                }
                .tag(0)
            
            FavoritesScene(viewModel: FavoritesSceneModel())
                .tabItem {
                    Image(systemName: "heart")
                        .environment(\.symbolVariants, .none)
                }
                .tag(1)

            SettingsScene(viewModel: SettingsSceneModel())
                .tabItem {
                    Image(systemName: "gearshape")
                        .environment(\.symbolVariants, .none)
                }
                .tag(2)
        }
        .accentColor(.appPrimary)
    }
    
    func setupAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
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
