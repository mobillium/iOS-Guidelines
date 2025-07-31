//
//  CategoryDetail.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct CategoryDetail {
    public let id: Int
    public let name: String?
    public let mainCategoryId: Int?
    public let image: ImageModel?

    public init(id: Int, name: String?, mainCategoryId: Int?, image: ImageModel?) {
        self.id = id
        self.name = name
        self.mainCategoryId = mainCategoryId
        self.image = image
    }
}
