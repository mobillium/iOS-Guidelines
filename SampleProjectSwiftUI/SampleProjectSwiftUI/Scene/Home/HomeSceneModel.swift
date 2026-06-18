//
//  HomeSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 20.10.2022.
//

import Combine
import DataProvider
import Utilities

@MainActor
class HomeSceneModel: BaseSceneModel {

    private let authRepository = AuthRepository(dataProvider: apiDataProvider)

    func logout() {
        Task {
            showFullScreenLoading = true
            let result = await authRepository.logout()
            showFullScreenLoading = false
            switch result {
            case .success:
                TokenStorage.delete()
            case .failure(let error):
                print("Logout failed: \(error)")
            }
        }
    }
}
