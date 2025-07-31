//
//  NumberOfPersonResponse.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Domain
import Network

struct NumberOfPersonResponse: Decodable {
    let text: String?
}

struct NumberOfPersonResonseMapper: ResponseMappable {
    typealias ResponseType = NumberOfPersonResponse
    typealias DomainType = NumberOfPerson
    
    func map(from response: ResponseType) -> DomainType {
        return NumberOfPerson(text: response.text)
    }
}
