//
//  BaseSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 15.09.2022.
//

import Combine

class BaseSceneModel: ObservableObject {
    @Published var showLoading = false
    @Published var showFullScreenLoading = false
    @Published var showTryAgainButton = false
    
    func tryAgainButtonAction() {}
}
