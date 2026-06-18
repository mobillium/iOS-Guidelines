//
//  HomeScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 20.10.2022.
//

import Combine
import SwiftUI
import Components
import Router
import LocalizationKit
import DataProvider

struct HomeScene<ViewModel: HomeSceneModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    @State var selectedIndex = 0
    @State var options = [L10n.Home.editorChoiceRecipes, L10n.Home.lastAddedRecipes]
    @ObservedObject var router = Router()
    @State private var showLogoutAlert = false
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        setupAppearance()
    }
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            BaseScene(content: {
                VStack(spacing: 8) {
                    AppSegmentView(selectedIndex: $selectedIndex, options: $options)
                                        
                    TabView(selection: $selectedIndex) {
                        RecipesScene(viewModel: RecipesSceneModel(listType: .editorChoiceRecipes))
                            .tag(0)
                        RecipesScene(viewModel: RecipesSceneModel(listType: .lastAddedRecipes))
                            .tag(1)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
            }, viewModel: viewModel)
            .navigationDestination(for: RecipeDestinations.self)
            .sheetDestination(router: router, for: AuthSheetDestinations.self)
            .ignoresSafeArea(edges: .bottom)
            .background(Color.appElevation1)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal, content: {
                    Image("fodamy-logo")
                        .resizable()
                        .frame(width: 110, height: 30)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.appPureWhite)
                })
                if TokenStorage.isLoggedIn {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showLogoutAlert = true
                        } label: {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .foregroundColor(.appPureWhite)
                        }
                    }
                }
            }
            .alert("Çıkış Yap", isPresented: $showLogoutAlert) {
                Button("Çıkış Yap", role: .destructive) { viewModel.logout() }
                Button("İptal", role: .cancel) {}
            } message: {
                Text("Hesabından çıkmak istediğinden emin misin?")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(router)
    }
    
    func setupAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Color.appPrimary.uiColor
        appearance.titleTextAttributes = [
            .foregroundColor: Color.appPureWhite.uiColor,
            .font: Font.uiFont(.nunitoExtraBold, size: .medium)
        ]
        
//         Geri buton rengi (ikon + text)
        appearance.setBackIndicatorImage(
            UIImage(systemName: "chevron.left"),
            transitionMaskImage: UIImage(systemName: "chevron.left")
        )

        appearance.backButtonAppearance.normal.titleTextAttributes = [
            .foregroundColor: Color.appPureWhite.uiColor
        ]
        
        UINavigationBar.appearance().tintColor = Color.appPureWhite.uiColor
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

}

#Preview {
    let viewModel = HomeSceneModel()
    return HomeScene(viewModel: viewModel) 
}
