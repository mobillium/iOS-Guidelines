//
//  PostRecipeLikeRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

public struct AddRecipeLikeRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "recipe/{recipeId}/like"
    public var method: RequestMethod = .post
    
    public init(recipeId: Int) {
        self.path = "recipe/\(recipeId)/like"
    }
}
