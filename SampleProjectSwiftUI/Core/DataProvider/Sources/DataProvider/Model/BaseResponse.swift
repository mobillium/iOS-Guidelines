//
//  BaseResponse.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Foundation
import Domain
import Network

struct BaseResponse<T: Decodable>: Decodable {
    let data: T
}

struct BaseModelMapper<M: ResponseMappable & Initable>: ResponseMappable {
    typealias ResponseType = BaseResponse<M.ResponseType>
    typealias DomainType = BaseModel<M.DomainType>
    
    func map(from response: ResponseType) -> DomainType {
        let data = M().map(from: response.data)
        return BaseModel(data: data)
    }
}
