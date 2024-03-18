//
//  RecipeCommentRepository.swift
//
//
//  Created by Mehmet Salih Aslan on 1.02.2024.
//

import Foundation
import Network

public protocol RecipeCommentRepositoryProtocol {
    func deleteRecipeComment(recipeId: Int, commentId: Int) async -> DecodableResult<SuccessResponse>
    func getRecipeComments(recipeId: Int, page: Int?) async -> DecodableResult<BaseResponse<[RecipeComment]>>
    func editRecipeComment(recipeId: Int, commentId: Int, commentText: String) async -> DecodableResult<SuccessResponse>
    func addRecipeComment(recipeId: Int, commentText: String) async -> DecodableResult<RecipeComment>
}
public final class RecipeCommentRepository: BaseRepository, RecipeCommentRepositoryProtocol {
    
    public func deleteRecipeComment(recipeId: Int, commentId: Int) async -> DecodableResult<SuccessResponse> {
        let request = DeleteRecipeCommentRequest(recipeId: recipeId, commentId: commentId)
        return await decodableResponse(request: request)
    }
    
    public func getRecipeComments(recipeId: Int, page: Int? = 1) async -> DecodableResult<BaseResponse<[RecipeComment]>> {
        let request = GetRecipeCommentsRequest(recipeId: recipeId, page: page)
        return await decodableResponse(request: request)
    }
    
    public func editRecipeComment(recipeId: Int, commentId: Int, commentText: String) async -> DecodableResult<SuccessResponse> {
        let request = EditRecipeCommentRequest(recipeId: recipeId, commentId: commentId, commentText: commentText)
        return await decodableResponse(request: request)
    }
    
    public func addRecipeComment(recipeId: Int, commentText: String) async -> DecodableResult<RecipeComment> {
        let request = AddRecipeCommentRequest(recipeId: recipeId, commentText: commentText)
        return await decodableResponse(request: request)
    }
}
