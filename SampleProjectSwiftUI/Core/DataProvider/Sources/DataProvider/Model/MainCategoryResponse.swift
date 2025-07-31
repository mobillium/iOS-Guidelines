//
//  MainCategoryResponse.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Domain
import Network

struct MainCategoryResponse: Decodable {
    let id: Int
    let name: String?
    let recipes: [RecipeResponse]
    let image: ImageResponse?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case recipes
        case image
    }
}

struct MainCategoryResponseMapper: ResponseMappable, Initable {
    typealias ResponseType = MainCategoryResponse
    typealias DomainType = MainCategory
    
    func map(from response: ResponseType) -> DomainType {
        let recipes = RecipeResonseMapper().mapList(from: response.recipes)
        let image = ImageResponseMapper().map(from: response.image)
        return MainCategory(
            id: response.id,
            name: response.name,
            recipes: recipes,
            image: image
        )
    }
}
