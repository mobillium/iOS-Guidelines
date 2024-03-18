//
//  RecipeDetailScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 15.02.2024.
//

import Combine
import SwiftUI

struct RecipeDetailScene<ViewModel: RecipeDetailSceneModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        BaseScene(content: {
            Text("RecipeDetail")
        }, viewModel: viewModel)
    }
}

#Preview {
    let viewModel = RecipeDetailSceneModel(dataProvider: apiDataProvider)
    return RecipeDetailScene(viewModel: viewModel)
}
