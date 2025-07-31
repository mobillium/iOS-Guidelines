//
//  RecipeLikeRepositoryProtocol.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 24.07.2025.
//

import Network

public protocol RecipeRepositoryProtocol {
    // MARK: - Recipe
    func getCategoriesWithRecipes(page: Int) async -> DomainResult<BaseArrayModel<MainCategory>>
    func getRecipes(page: Int, listType: RecipeListType) async -> DomainResult<BaseArrayModel<Recipe>>
    func getRecipeDetail(recipeId: Int) async -> DomainResult<RecipeDetail>
    
    // MARK: - Comment
    func deleteRecipeComment(recipeId: Int, commentId: Int) async -> DomainResult<SuccessModel>
    func getRecipeComments(recipeId: Int, page: Int?) async -> DomainResult<BaseArrayModel<RecipeComment>>
    func editRecipeComment(recipeId: Int, commentId: Int, commentText: String) async -> DomainResult<SuccessModel>
    func addRecipeComment(recipeId: Int, commentText: String) async -> DomainResult<RecipeComment>
    
    // MARK: - Like
    func addRecipeLike(recipeId: Int) async -> DomainResult<SuccessModel>
    func deleteRecipeLike(recipeId: Int) async -> DomainResult<SuccessModel>
}
