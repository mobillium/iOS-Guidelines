//
//  FavoritesDestinations.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 10.07.2025.
//

import SwiftUI

enum FavoritesDestinations: DestinationProtocol {
    case recipeDetail

    @MainActor
    @ViewBuilder
    var view: some View {
        switch self {
        case .recipeDetail:
            RecipeDetailDestination.recipeDetail.view
        }
    }
}
