//
//  RecipeRepository.swift
//
//
//  Created by Mehmet Salih Aslan on 1.02.2024.
//

import Foundation
import Network
import Domain

public final class RecipeRepository: BaseRepository, RecipeRepositoryProtocol {
    
    // MARK: - Recipe
    public func getCategoriesWithRecipes(page: Int) async -> DomainResult<BaseArrayModel<MainCategory>> {
        let request = GetCategoriesWithRecipesRequest(page: page)
        let mapper = BaseArrayModelMapper<MainCategoryResponseMapper>()
        return await networkResponse(request: request, mapper: mapper)
    }
    
    public func getRecipes(page: Int, listType: RecipeListType) async -> DomainResult<BaseArrayModel<Recipe>> {
        let request = GetRecipesRequest(page: page, listType: listType)
        let mapper = BaseArrayModelMapper<RecipeResonseMapper>()
        return await networkResponse(request: request, mapper: mapper)
    }
    
    public func getRecipeDetail(recipeId: Int) async -> DomainResult<RecipeDetail> {
        let request = GetRecipeDetailRequest(recipeId: recipeId)
        return await networkResponse(request: request, mapper: RecipeDetailResonseMapper())
    }
    
    // MARK: - Like
    public func addRecipeLike(recipeId: Int) async -> DomainResult<SuccessModel> {
        let request = AddRecipeLikeRequest(recipeId: recipeId)
        return await networkResponse(request: request, mapper: SuccessResponseMapper())
    }
    
    public func deleteRecipeLike(recipeId: Int) async -> DomainResult<SuccessModel> {
        let request = DeleteRecipeLikeRequest(recipeId: recipeId)
        return await networkResponse(request: request, mapper: SuccessResponseMapper())
    }
    
    // MARK: - Comment
    public func deleteRecipeComment(recipeId: Int, commentId: Int) async -> DomainResult<SuccessModel> {
        let request = DeleteRecipeCommentRequest(recipeId: recipeId, commentId: commentId)
        return await networkResponse(request: request, mapper: SuccessResponseMapper())
    }
    
    public func getRecipeComments(recipeId: Int, page: Int? = 1) async -> DomainResult<BaseArrayModel<RecipeComment>> {
        let request = GetRecipeCommentsRequest(recipeId: recipeId, page: page)
        let mapper = BaseArrayModelMapper<RecipeCommentResonseMapper>()
        return await networkResponse(request: request, mapper: mapper)
    }
    
    public func editRecipeComment(recipeId: Int, commentId: Int, commentText: String) async -> DomainResult<SuccessModel> {
        let request = EditRecipeCommentRequest(recipeId: recipeId, commentId: commentId, commentText: commentText)
        return await networkResponse(request: request, mapper: SuccessResponseMapper())
    }
    
    public func addRecipeComment(recipeId: Int, commentText: String) async -> DomainResult<RecipeComment> {
        let request = AddRecipeCommentRequest(recipeId: recipeId, commentText: commentText)
        return await networkResponse(request: request, mapper: RecipeCommentResonseMapper())
    }
}
