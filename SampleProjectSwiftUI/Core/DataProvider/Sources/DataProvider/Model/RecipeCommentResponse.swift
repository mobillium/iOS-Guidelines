//
//  RecipeCommentResponse.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Domain
import Network

struct RecipeCommentResponse: Decodable {
    let id: Int
    let text: String?
    let timeDifference: String?
    let user: UserResponse
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case timeDifference = "difference"
        case user
    }
}

struct RecipeCommentResonseMapper: ResponseMappable, Initable {
    typealias ResponseType = RecipeCommentResponse
    typealias DomainType = RecipeComment
        
    func map(from response: ResponseType) -> DomainType {
        let user = UserResonseMapper().map(from: response.user)
        return RecipeComment(
            id: response.id,
            text: response.text,
            timeDifference: response.timeDifference,
            user: user
        )
    }
}
