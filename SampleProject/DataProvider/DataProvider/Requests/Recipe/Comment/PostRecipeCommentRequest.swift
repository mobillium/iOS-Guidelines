//
//  PostRecipeCommentRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct PostRecipeCommentRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = RecipeComment

    public var path: String = "recipe/{recipeId}/comment"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(recipeId: Int, commentText: String) {
        self.path = "recipe/\(recipeId)/comment"
        self.parameters["text"] = commentText
    }
    
}
