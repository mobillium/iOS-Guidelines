//
//  CategoryDetailResponse.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Domain
import Network

struct CategoryDetailResponse: Decodable {
    let id: Int
    let name: String?
    let mainCategoryId: Int?
    let image: ImageResponse?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case mainCategoryId = "main_category_id"
        case image
    }
}

struct CategoryDetailResponseMapper: ResponseMappable {
    typealias ResponseType = CategoryDetailResponse
    typealias DomainType = CategoryDetail
    
    func map(from response: ResponseType) -> DomainType {
        let image = ImageResponseMapper().map(from: response.image)
        return CategoryDetail(
            id: response.id,
            name: response.name,
            mainCategoryId: response.mainCategoryId,
            image: image
        )
    }
}
