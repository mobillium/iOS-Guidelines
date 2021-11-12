//
//  GetRecipeDetailRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct GetRecipeDetailRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = RecipeDetail
    
    public var path: String = "recipe/{recipeId}"
    public var method: RequestMethod = .get
    
    public init(recipeId: Int) {
        self.path = "recipe/\(recipeId)"
    }
}
