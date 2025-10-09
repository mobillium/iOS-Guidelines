//
//  HomeDestinations.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 10.07.2025.
//

import SwiftUI

enum HomeDestinations: DestinationProtocol {
    case recipeDetail(recipeId: Int)

    @MainActor
    @ViewBuilder
    var view: some View {
        switch self {
        case .recipeDetail(let recipeId):
            RecipeDetailDestination.recipeDetail(recipeId: recipeId).view
        }
    }
}
