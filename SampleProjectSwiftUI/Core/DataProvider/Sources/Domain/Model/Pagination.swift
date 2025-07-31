//
//  Pagination.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct Pagination {
    public let currentPage: Int
    public let lastPage: Int
    
    public init(currentPage: Int, lastPage: Int) {
        self.currentPage = currentPage
        self.lastPage = lastPage
    }
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case lastPage = "last_page"
    }
}
