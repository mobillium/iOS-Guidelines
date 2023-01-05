//
//  FavoritesScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 20.10.2022.
//

import Combine
import SwiftUI

struct FavoritesScene<ViewModel: FavoritesSceneModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        BaseScene(content: {
            ScrollView(.vertical) {
                ForEach(viewModel.viewModels) { viewModel in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(viewModel.title ?? "")
                                .font(.font(.nunitoBold, size: .xxLarge))
                                .foregroundColor(.appCinder)
                                .padding(.leading, 8)
                            
                            Spacer()
                            
                            Button("TÜMÜNÜ GÖR") {
                                
                            }
                        }
                        .frame(height: 48)
                        .background(Color.appWhite)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModel.viewModels) { viewModel in
                                    HorizontalRecipeView(viewModel: viewModel)
                                }
                            }
                        }
                        .frame(height: 217)
                    }
                }
            }
        }, viewModel: viewModel)
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
