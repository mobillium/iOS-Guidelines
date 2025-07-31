//
//  AddRecipeCommentRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

struct AddRecipeCommentRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = RecipeCommentResponse

    var path: String = "recipe/{recipeId}/comment"
    var method: RequestMethod = .post
    var bodyParameters: RequestParameters = [:]
    
    init(recipeId: Int, commentText: String) {
        self.path = "recipe/\(recipeId)/comment"
        self.bodyParameters["text"] = commentText
    }
}
