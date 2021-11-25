//
//  RecipeDeleteLikeRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.11.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

public struct RecipeDeleteLikeRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "recipe/{recipeId}/like"
    public var method: RequestMethod = .delete
    
    public init(recipeId: Int) {
        self.path = "recipe/\(recipeId)/like"
    }
}
