//
//  DeleteRecipeLikeRequest.swift
//
//
//  Created by Mehmet Salih Aslan on 2.02.2024.
//

import Network

public struct DeleteRecipeLikeRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "recipe/{recipeId}/like"
    public var method: RequestMethod = .delete
    
    public init(recipeId: Int) {
        self.path = "recipe/\(recipeId)/like"
    }
}
