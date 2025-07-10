//
//  AppDestinations.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 10.07.2025.
//

import SwiftUI

enum AppDestinations: DestinationProtocol {
    case recipeDetail

    @MainActor
    @ViewBuilder
    var view: some View {
        switch self {
        case .recipeDetail:
            let viewModel = RecipeDetailSceneModel(dataProvider: apiDataProvider)
            return RecipeDetailScene(viewModel: viewModel)
        }
    }
}
