//
//  EditRecipeCommentRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

struct EditRecipeCommentRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = SuccessResponse
    
    var path: String = "recipe/{recipeId}/comment/{commentId}"
    var method: RequestMethod = .put
    var bodyParameters: RequestParameters = [:]
    
    init(recipeId: Int, commentId: Int, commentText: String) {
        self.path = "recipe/\(recipeId)/comment/\(commentId)"
        self.bodyParameters["text"] = commentText
    }
}
