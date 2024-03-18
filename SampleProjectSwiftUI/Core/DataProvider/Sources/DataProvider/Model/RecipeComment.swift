//
//  RecipeComment.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct RecipeComment: Decodable {
    public let id: Int
    public let text: String?
    public let timeDifference: String?
    public let user: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case timeDifference = "difference"
        case user
    }
}
