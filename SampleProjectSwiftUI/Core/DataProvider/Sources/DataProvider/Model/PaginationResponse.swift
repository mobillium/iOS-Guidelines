//
//  PaginationResponse.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Domain
import Network

struct PaginationResponse: Decodable {
    let currentPage: Int
    let lastPage: Int
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case lastPage = "last_page"
    }
}

struct PaginationResonseMapper: ResponseMappable {
    typealias ResponseType = PaginationResponse
    typealias DomainType = Pagination
    
    func map(from response: ResponseType) -> DomainType {
        return Pagination(
            currentPage: response.currentPage,
            lastPage: response.lastPage
        )
    }
}
