//
//  BaseSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 15.09.2022.
//

import Combine
import Network

class BaseSceneModel: ObservableObject {
    
    @Published var showLoading = false
    @Published var showFullScreenLoading = false
    @Published var showTryAgainButton = false
    
//    @EnvironmentObject private var router: Router
    private var dataProvider: DataProviderProtocol
    
    init(dataProvider: DataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    func tryAgainButtonAction() {}
    
}
