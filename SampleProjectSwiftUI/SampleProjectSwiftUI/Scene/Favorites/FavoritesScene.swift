//
//  FavoritesScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 20.10.2022.
//

import Combine
import SwiftUI
import Components

struct FavoritesScene<ViewModel: FavoritesSceneModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            BaseScene(content: {
                ScrollView(.vertical, showsIndicators: false) {
                    Spacer()
                        .frame(height: 16)
                    ForEach(viewModel.viewModels) { viewModel in
                        VStack(alignment: .leading, spacing: 0) {
                            HorizontalRecipesHeaderView(viewModel: viewModel.headerViewModel)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.appSeparator)
                            HorizontalRecipesView(viewModel: viewModel.recipesViewModel)
                        }
                        .padding(.bottom, 16)
                    }
                }
            }, viewModel: viewModel)
            .frame(width: UIScreen.main.bounds.size.width)
            .background(Color.appSecondaryBackground)
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
        .onAppear {
            viewModel.fetchRecipes()
        }
        
    }
}

struct FavoritesScene_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FavoritesSceneModel()
        return FavoritesScene(viewModel: viewModel)
    }
}
