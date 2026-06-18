//
//  RecipeDestinations.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 18.06.2026.
//

import SwiftUI

enum RecipeDestinations: DestinationProtocol {
    case recipeComments(recipeId: Int)
    case recipeDetail(recipeId: Int)

    @MainActor
    @ViewBuilder
    var view: some View {
        switch self {
        case .recipeComments(let recipeId):
            RecipeCommentsScene(viewModel: RecipeCommentsSceneModel(recipeId: recipeId))
        case .recipeDetail(let recipeId):
            RecipeDetailScene(viewModel: RecipeDetailSceneModel(recipeId: recipeId))
        }
    }
}
