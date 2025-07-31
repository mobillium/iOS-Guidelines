//
//  SuccessResponse.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Domain
import Network

struct SuccessResponse: Decodable {
    let message: String?
}

struct SuccessResponseMapper: ResponseMappable {
    typealias ResponseType = SuccessResponse
    typealias DomainType = SuccessModel
    
    func map(from response: ResponseType) -> DomainType {
        return SuccessModel(message: response.message)
    }
}
