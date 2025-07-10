//
//  RecipeDetailDestination.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 10.07.2025.
//

import SwiftUI

enum RecipeDetailDestination: DestinationProtocol {
    case recipeDetail

    @MainActor
    @ViewBuilder
    var view: some View {
        switch self {
        case .recipeDetail:
            RecipeDetailScene(viewModel: RecipeDetailSceneModel(dataProvider: apiDataProvider))
        }
    }
}
