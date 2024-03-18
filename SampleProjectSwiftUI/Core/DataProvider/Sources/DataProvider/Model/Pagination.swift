//
//  Pagination.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct Pagination: Decodable {
    public let currentPage: Int
    public let lastPage: Int
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case lastPage = "last_page"
    }
}
