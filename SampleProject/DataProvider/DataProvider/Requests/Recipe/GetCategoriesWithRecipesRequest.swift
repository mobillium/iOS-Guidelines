//
//  GetCategoriesWithRecipesRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct GetCategoriesWithRecipesRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[MainCategory]>

    public var path: String = "category-recipes"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(page: Int) {
        parameters["page"] = page
    }
    
}
