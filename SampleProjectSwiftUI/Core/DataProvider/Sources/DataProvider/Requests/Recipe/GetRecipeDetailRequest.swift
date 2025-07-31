//
//  GetRecipeDetailRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//
import Network

struct GetRecipeDetailRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = RecipeDetailResponse
    
    var path: String = "recipe/{recipeId}"
    var method: RequestMethod = .get
    
    init(recipeId: Int) {
        self.path = "recipe/\(recipeId)"
    }
}
