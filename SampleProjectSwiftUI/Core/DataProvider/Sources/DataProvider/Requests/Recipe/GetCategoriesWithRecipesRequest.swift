//
//  GetCategoriesWithRecipesRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

public struct GetCategoriesWithRecipesRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[MainCategory]>

    public var path: String = "category-recipes"
    public var method: RequestMethod = .get
    public var queryParameters: RequestParameters = [:]
    
    public init(page: Int) {
        queryParameters["page"] = page
    }
    
}
