//
//  PostRecipeLikeRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

struct AddRecipeLikeRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = SuccessResponse
    
    var path: String = "recipe/{recipeId}/like"
    var method: RequestMethod = .post
    
    init(recipeId: Int) {
        self.path = "recipe/\(recipeId)/like"
    }
}
