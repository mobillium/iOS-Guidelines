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

struct HomeScene<ViewModel: HomeSceneModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    @State var selectedIndex = 0
    @State var options = [L10n.Home.editorChoiceRecipes, L10n.Home.lastAddedRecipes]
    @ObservedObject var router = Router()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        setupAppearance()
    }
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            BaseScene(content: {
                VStack {
                    AppSegmentView(selectedIndex: $selectedIndex, options: $options)
                    
                    Spacer()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        TabView(selection: $selectedIndex) {
                            RecipesScene(viewModel: RecipesSceneModel(dataProvider: apiDataProvider,
                                                                      listType: .editorChoiceRecipes))
                                .tag(0)
                            RecipesScene(viewModel: RecipesSceneModel(dataProvider: apiDataProvider,
                                                                      listType: .lastAddedRecipes))
                                .tag(1)
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .tabViewStyle(.page(indexDisplayMode: .never))
                    }
                }
            }, viewModel: viewModel)
            .navigationDestination(for: HomeDestinations.self)
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
        .environmentObject(router)
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

#Preview {
    let viewModel = HomeSceneModel(dataProvider: apiDataProvider)
    return HomeScene(viewModel: viewModel)
}
