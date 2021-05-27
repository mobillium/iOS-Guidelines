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

protocol HomeViewEventSource { }

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource { }

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    var segmentedControlTitles: [String] = [L10n.Modules.Home.editorChoiceRecipes,
                                            L10n.Modules.Home.lastAddedRecipes]
    
    var listType: ListType = .editorChoiceRecipes {
        didSet {
            router.pushRecipes(listType: listType)
        }
    }
    
    var selectedSegmentIndex = 0
}
