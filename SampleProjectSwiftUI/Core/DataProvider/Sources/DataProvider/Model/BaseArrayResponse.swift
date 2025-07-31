//
//  BaseArrayResponse.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 24.07.2025.
//

import Foundation
import Domain
import Network

struct BaseArrayResponse<T: Decodable>: Decodable {
    let data: [T]
    let pagination: PaginationResponse
}

struct BaseArrayModelMapper<M: ResponseMappable & Initable>: ResponseMappable {
    typealias ResponseType = BaseArrayResponse<M.ResponseType>
    typealias DomainType = BaseArrayModel<M.DomainType>

    func map(from response: ResponseType) -> DomainType {
        let data = response.data.map { M().map(from: $0) }
        let pagination = PaginationResonseMapper().map(from: response.pagination)
        return BaseArrayModel(data: data, pagination: pagination)
    }
}
