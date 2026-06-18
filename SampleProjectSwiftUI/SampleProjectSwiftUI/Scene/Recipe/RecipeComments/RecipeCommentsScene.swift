//
//  RecipeCommentsScene.swift
//  SampleProjectSwiftUI
//
//  Created by Murat Celebi on 18.12.2025.
//

import SwiftUI
import Components

struct RecipeCommentsScene<ViewModel: RecipeCommentsSceneModel>: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        BaseScene(content: {
            
            List(viewModel.recipeComments, id: \.id) { recipe in
                RecipeCommentView(
                    userName: recipe.user.username,
                    userImageUrl: recipe.user.image?.url,
                    userStat: "\(recipe.user.recipeCount) Tarif \(recipe.user.followedCount) Takipçi",
                    commentDate: recipe.timeDifference,
                    comment: recipe.text
                )
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
            .listRowSpacing(16)
            
        }, viewModel: viewModel)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            Task { @MainActor in
                await viewModel.fetchRecipeComments()
            }
        }
        .navigationTitle("YORUMLAR")
        .background(Color.appElevation1)
    }
}

#Preview {
    let viewModel = RecipeCommentsSceneModel(recipeId: 5)
    return RecipeCommentsScene(viewModel: viewModel)
}
