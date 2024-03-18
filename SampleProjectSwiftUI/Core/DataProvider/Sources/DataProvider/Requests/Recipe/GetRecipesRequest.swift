//
//  GetRecipesRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

public struct GetRecipesRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[Recipe]>
    
    public var path: String = ""
    public var method: RequestMethod = .get
    public var queryParameters: RequestParameters = [:]
    
    public init(page: Int, listType: RecipeListType) {
        self.queryParameters["page"] = page
        switch listType {
        case .editorChoiceRecipes:
            path = "editor-choices"
        case .lastAddedRecipes:
            path = "recipe/"
        case .categoryRecipes(let categoryId):
            path = "category/\(categoryId)/recipe"
        }
    }
}

