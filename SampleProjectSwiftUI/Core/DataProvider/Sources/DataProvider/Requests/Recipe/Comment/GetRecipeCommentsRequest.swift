//
//  GetRecipeCommentsRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

struct GetRecipeCommentsRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = BaseArrayResponse<RecipeCommentResponse>
    
    var path: String = "recipe/{recipeId}/comment"
    var method: RequestMethod = .get
    var queryParameters: RequestParameters = [:]
    
    init(recipeId: Int, page: Int? = 1) {
        self.path = "recipe/\(recipeId)/comment"
        self.queryParameters["page"] = page
    }
}
