//
//  GetCategoriesWithRecipesRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

struct GetCategoriesWithRecipesRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = BaseArrayResponse<MainCategoryResponse>

    var path: String = "category-recipes"
    var method: RequestMethod = .get
    var queryParameters: RequestParameters = [:]
    
    init(page: Int) {
        queryParameters["page"] = page
    }
}
