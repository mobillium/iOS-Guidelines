//
//  RecipeComment.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct RecipeComment {
    public let id: Int
    public let text: String?
    public let timeDifference: String?
    public let user: User
    
    public init(id: Int,
                text: String?,
                timeDifference: String?,
                user: User) {
        self.id = id
        self.text = text
        self.timeDifference = timeDifference
        self.user = user
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case timeDifference = "difference"
        case user
    }
}
