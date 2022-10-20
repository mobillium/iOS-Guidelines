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
        Text("Favorites")
    }
}

struct FavoritesScene_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FavoritesSceneModel()
        return FavoritesScene(viewModel: viewModel)
    }
}
