//
//  GetRecipesRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network
import Domain

struct GetRecipesRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = BaseArrayResponse<RecipeResponse>
    
    var path: String = ""
    var method: RequestMethod = .get
    var queryParameters: RequestParameters = [:]
    
    init(page: Int, listType: RecipeListType) {
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
