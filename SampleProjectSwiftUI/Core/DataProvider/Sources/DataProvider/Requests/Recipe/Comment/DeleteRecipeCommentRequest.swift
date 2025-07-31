//
//  DeleteRecipeCommentRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

struct DeleteRecipeCommentRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = SuccessResponse
    
    var path: String = "recipe/{recipeId}/comment/{commentId}"
    var method: RequestMethod = .delete
    
    init(recipeId: Int, commentId: Int) {
        self.path = "recipe/\(recipeId)/comment/\(commentId)"
    }
}
