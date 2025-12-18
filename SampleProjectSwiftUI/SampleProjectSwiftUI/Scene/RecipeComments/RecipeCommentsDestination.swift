//
//  RecipeCommentsDestination.swift
//  SampleProjectSwiftUI
//
//  Created by Murat Celebi on 18.12.2025.
//

import SwiftUI

enum RecipeCommentsDestination: DestinationProtocol {
    case recipeComments(recipeId: Int)

    @MainActor
    @ViewBuilder
    var view: some View {
        switch self {
        case .recipeComments(let recipeId):
            RecipeCommentsScene(viewModel: RecipeCommentsSceneModel(recipeId: recipeId))
        }
    }
}
