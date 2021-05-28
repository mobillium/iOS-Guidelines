//
//  HomeViewModel.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Foundation

protocol HomeViewDataSource {
    var segmentedControlTitles: [String] { get }
    var selectedSegmentIndex: Int { get }
}

protocol HomeViewEventSource {
    var didSuccesLogout: VoidClosure? { get set }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func pushDetailViewController(recipeId: Int)
    func userLogout()
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    var segmentedControlTitles: [String] = [L10n.Modules.Home.editorChoiceRecipes,
                                            L10n.Modules.Home.lastAddedRecipes]
    
    var listType: ListType = .editorChoiceRecipes {
        didSet {
            router.pushRecipes(listType: listType)
        }
    }
    
    var selectedSegmentIndex = 0
    var didSuccesLogout: VoidClosure?
    
    func pushDetailViewController(recipeId: Int) {
        router.pushRecipeDetail(recipeId: recipeId)
    }
    
}

// MARK: - Network
extension HomeViewModel {
    func userLogout() {
        showLoading?()
        let request = LogoutRequest()
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                self.didSuccesLogout?()
                print(response.message)
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
