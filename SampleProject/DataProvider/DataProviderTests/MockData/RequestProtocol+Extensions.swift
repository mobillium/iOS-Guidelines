//
//  RequestProtocol+Extensions.swift
//  DataProviderTests
//
//  Created by Mehmet Salih Aslan on 29.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

extension RequestProtocol {
    
    var mockFileName: String {
        switch self {
        case is GetRecipesRequest:
            switch (self as? GetRecipesRequest)?.listType {
            case .lastAddedRecipes:
                return "GetLastAddedRecipesRequest"
            case .editorChoiceRecipes:
                return "GetEditorChoiceRecipesRequest"
            case .categoryRecipes:
                return "GetCategoryRecipesRequest"
            case .none:
                break
            }
        case is RecipeLikeRequest:
            switch (self as? RecipeLikeRequest)?.likeType {
            case .like:
                return "RecipeLikeRequest"
            case .unlike:
                return "RecipeUnlikeRequest"
            case .none:
                break
            }
        default:
            return String(describing: Self.self)
        }
        return String(describing: Self.self)
    }
    
}
