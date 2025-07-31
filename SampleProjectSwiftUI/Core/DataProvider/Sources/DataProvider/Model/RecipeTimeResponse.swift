//
//  RecipeTimeResponse.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Domain
import Network

struct RecipeTimeResponse: Decodable {
    let text: String?
}

struct RecipeTimeResonseMapper: ResponseMappable {
    typealias ResponseType = RecipeTimeResponse
    typealias DomainType = RecipeTime
    
    func map(from response: ResponseType) -> DomainType {
        return RecipeTime(text: response.text)
    }
}
