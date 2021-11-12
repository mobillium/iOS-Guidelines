//
//  MainCategory.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct MainCategory: Decodable {
    public let id: Int
    public let name: String?
    public let recipes: [Recipe]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case recipes
    }
}
