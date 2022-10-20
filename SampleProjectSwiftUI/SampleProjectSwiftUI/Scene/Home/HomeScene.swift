//
//  HomeScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 20.10.2022.
//

import Combine
import SwiftUI

struct HomeScene<ViewModel: HomeSceneModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Text("Home")
    }
}

struct HomeScene_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HomeSceneModel()
        return HomeScene(viewModel: viewModel)
    }
}
