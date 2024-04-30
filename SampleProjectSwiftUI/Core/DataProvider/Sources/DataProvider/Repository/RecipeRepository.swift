//
//  RecipeRepository.swift
//
//
//  Created by Mehmet Salih Aslan on 1.02.2024.
//

import Foundation
import Network

public protocol RecipeRepositoryProtocol {
    func getCategoriesWithRecipes(page: Int) async -> DecodableResult<BaseResponse<[MainCategory]>>
    func getRecipes(page: Int, listType: RecipeListType) async -> DecodableResult<BaseResponse<[Recipe]>>
    func getRecipeDetail(recipeId: Int) async -> DecodableResult<RecipeDetail>
}
public final class RecipeRepository: BaseRepository, RecipeRepositoryProtocol {
    
    public func getCategoriesWithRecipes(page: Int) async -> DecodableResult<BaseResponse<[MainCategory]>> {
        let request = GetCategoriesWithRecipesRequest(page: page)
        return await decodableResponse(request: request)
    }
    
    public func getRecipes(page: Int, listType: RecipeListType) async -> DecodableResult<BaseResponse<[Recipe]>> {
        let request = GetRecipesRequest(page: page, listType: listType)
        return await decodableResponse(request: request)
    }
    
    public func getRecipeDetail(recipeId: Int) async -> DecodableResult<RecipeDetail> {
        let request = GetRecipeDetailRequest(recipeId: recipeId)
        return await decodableResponse(request: request)
    }
}
