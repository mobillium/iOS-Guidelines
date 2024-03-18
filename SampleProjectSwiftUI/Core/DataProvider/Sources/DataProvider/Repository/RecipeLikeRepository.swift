//
//  File.swift
//  
//
//  Created by Mehmet Salih Aslan on 2.02.2024.
//

import Foundation
import Network

public protocol RecipeLikeRepositoryProtocol {
    func addRecipeLike(recipeId: Int) async -> DecodableResult<SuccessResponse>
    func deleteRecipeLike(recipeId: Int) async -> DecodableResult<SuccessResponse>
}
public final class RecipeLikeRepository: BaseRepository, RecipeLikeRepositoryProtocol {
    
    public func addRecipeLike(recipeId: Int) async -> DecodableResult<SuccessResponse> {
        let request = AddRecipeLikeRequest(recipeId: recipeId)
        return await decodableResponse(request: request)
    }
    
    public func deleteRecipeLike(recipeId: Int) async -> DecodableResult<SuccessResponse> {
        let request = DeleteRecipeLikeRequest(recipeId: recipeId)
        return await decodableResponse(request: request)
    }
}
