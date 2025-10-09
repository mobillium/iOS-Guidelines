//
//  RecipeDetailDestination.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 10.07.2025.
//

import SwiftUI

enum RecipeDetailDestination: DestinationProtocol {
    case recipeDetail(recipeId: Int)

    @MainActor
    @ViewBuilder
    var view: some View {
        switch self {
        case .recipeDetail(let recipeId):
            RecipeDetailScene(viewModel: RecipeDetailSceneModel(recipeId: recipeId))
        }
    }
}
