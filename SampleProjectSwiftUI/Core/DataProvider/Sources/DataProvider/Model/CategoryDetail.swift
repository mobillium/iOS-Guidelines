//
//  CategoryDetail.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct CategoryDetail: Decodable {
    public let id: Int
    public let name: String?
    public let mainCategoryId: Int?
    public let imageUrl: Image?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case mainCategoryId = "main_category_id"
        case imageUrl = "image"
    }
}
