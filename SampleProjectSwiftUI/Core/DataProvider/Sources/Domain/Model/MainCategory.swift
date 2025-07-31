//
//  MainCategory.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct MainCategory {
    public let id: Int
    public let name: String?
    public let recipes: [Recipe]
    public let image: ImageModel?
    
    public init(id: Int, name: String?, recipes: [Recipe], image: ImageModel?) {
        self.id = id
        self.name = name
        self.recipes = recipes
        self.image = image
    }
}
