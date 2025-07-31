//
//  DeleteRecipeLikeRequest.swift
//
//
//  Created by Mehmet Salih Aslan on 2.02.2024.
//

import Network

struct DeleteRecipeLikeRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = SuccessResponse
    
    var path: String = "recipe/{recipeId}/like"
    var method: RequestMethod = .delete
    
    init(recipeId: Int) {
        self.path = "recipe/\(recipeId)/like"
    }
}
