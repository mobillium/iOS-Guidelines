//
//  CommentsViewModel.swift
//  SampleProject
//
//  Created by Oğuzhan Karakuş on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol CommentsViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> CommentsProtocol
}

protocol CommentsViewEventSource {}

protocol CommentsViewProtocol: CommentsViewDataSource, CommentsViewEventSource {}

final class CommentsViewModel: BaseViewModel<CommentsRouter>, CommentsViewProtocol {
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> CommentsProtocol {
        return cellItems[indexPath.row]
    }
    
    private let cellItems: [CommentsProtocol] = []
}
