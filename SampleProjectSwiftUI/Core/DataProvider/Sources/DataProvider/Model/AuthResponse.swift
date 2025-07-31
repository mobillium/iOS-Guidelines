//
//  AuthResponse.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Domain
import Network

struct AuthResponse: Decodable {
    let token: String
    let user: UserResponse
}

struct AuthResponseMapper: ResponseMappable {
    typealias ResponseType = AuthResponse
    typealias DomainType = Auth
    
    func map(from response: ResponseType) -> DomainType {
        let user = UserResonseMapper().map(from: response.user)
        return Auth(
            token: response.token,
            user: user
        )
    }
}
