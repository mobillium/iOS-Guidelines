//
//  GetRecipeCommentsRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

public struct GetRecipeCommentsRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[RecipeComment]>
    
    public var path: String = "recipe/{recipeId}/comment"
    public var method: RequestMethod = .get
    public var queryParameters: RequestParameters = [:]
    
    public init(recipeId: Int, page: Int? = 1) {
        self.path = "recipe/\(recipeId)/comment"
        self.queryParameters["page"] = page
    }
    
}
