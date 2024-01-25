//
//  EditRecipeCommentRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct EditRecipeCommentRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "recipe/{recipeId}/comment/{commentId}"
    public var method: RequestMethod = .put
    public var parameters: RequestParameters = [:]
    
    public init(recipeId: Int, commentId: Int, commentText: String) {
        self.path = "recipe/\(recipeId)/comment/\(commentId)"
        self.parameters["text"] = commentText
    }

}
