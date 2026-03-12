//
//  FavoritesScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 20.10.2022.
//

import Combine
import SwiftUI
import Components
import Router

struct FavoritesScene<ViewModel: FavoritesSceneModel>: View {
    
    @StateObject var viewModel: ViewModel
    @ObservedObject var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            BaseScene(content: {
                ScrollView(.vertical, showsIndicators: false) {
                    Spacer()
                        .frame(height: 16)
                    ForEach(viewModel.viewModels) { viewModel in
                        VStack(alignment: .leading, spacing: 0) {
                            HorizontalRecipesHeaderView(viewModel: viewModel.headerViewModel)
                            Divider()
                                .foregroundColor(.appElevation2)
                            HorizontalRecipesView(
                                viewModel: viewModel.recipesViewModel,
                            ) { recipeId in
                                let destination = FavoritesDestinations.recipeDetail(recipeId: recipeId)
                                router.navigate(to: destination)
                            }
                        }
                        .padding(.bottom, 16)
                    }
                }
            }, viewModel: viewModel)
            .navigationDestination(for: FavoritesDestinations.self)
            .frame(width: UIScreen.main.bounds.size.width)
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
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            Task { @MainActor in
                await viewModel.fetchRecipes()
            }
        }
        .environmentObject(router)
    }
}

#Preview {
    let viewModel = FavoritesSceneModel()
    return FavoritesScene(viewModel: viewModel)
}
