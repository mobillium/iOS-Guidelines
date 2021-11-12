//
//  DeleteRecipeCommentRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct DeleteRecipeCommentRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "recipe/{recipeId}/comment/{commentId}"
    public var method: RequestMethod = .delete
    
    public init(recipeId: Int, commentId: Int) {
        self.path = "recipe/\(recipeId)/comment/\(commentId)"
    }
    
}
