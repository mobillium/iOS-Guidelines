//
//  RecipeComment.swift
//  DataProvider
//
//  Created by Emirhan Battalbaş on 6.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

public struct RecipeCommentRequest: APIRequest {
    
    public typealias ResponseType = BaseResponse<[RecipeComment]>
    
    public var path: String = ""
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(recipedId: Int) {
        self.path = "recipe/\(recipedId)/comment"
    }
}
