//
//  ImageResponse.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Domain
import Network

struct ImageResponse: Decodable {
    let url: String?
}

struct ImageResponseMapper: ResponseMappable {
    typealias ResponseType = ImageResponse
    typealias DomainType = ImageModel
    
    func map(from response: ResponseType) -> DomainType {
        return ImageModel(url: response.url)
    }
}
