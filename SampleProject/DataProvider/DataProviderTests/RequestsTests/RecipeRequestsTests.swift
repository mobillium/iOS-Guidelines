//
//  RecipeRequests.swift
//  DataProviderTests
//
//  Created by Mehmet Salih Aslan on 29.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import XCTest

class RecipeRequests: XCTestCase {

    let dataProvider = MockDataProvider()

    func testGetLastAddedRecipes() throws {
        let expentation = expectation(description: "request expentation")

        let request = GetRecipesRequest(page: 1, listType: .lastAddedRecipes)
        dataProvider.request(for: request) { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expentation.fulfill()
        }
        wait(for: [expentation], timeout: 5)
    }
    
    func testGetEditorChoiceRecipes() throws {
        let expentation = expectation(description: "request expentation")

        let request = GetRecipesRequest(page: 1, listType: .editorChoiceRecipes)
        dataProvider.request(for: request) { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expentation.fulfill()
        }
        wait(for: [expentation], timeout: 5)
    }
    
    func testGetCategoryRecipes() throws {
        let expentation = expectation(description: "request expentation")

        let request = GetRecipesRequest(page: 1, listType: .categoryRecipes(categoryId: 1))
        dataProvider.request(for: request) { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expentation.fulfill()
        }
        wait(for: [expentation], timeout: 5)
    }
    
    func testGetCategoriesWithRecipesRequest() throws {
        let expentation = expectation(description: "request expentation")

        let request = GetCategoriesWithRecipesRequest(page: 1)
        dataProvider.request(for: request) { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expentation.fulfill()
        }
        wait(for: [expentation], timeout: 5)
    }
    
    func testGetRecipeDetailRequest() throws {
        let expentation = expectation(description: "request expentation")
        let request = GetRecipeDetailRequest(recipeId: 1)
        dataProvider.request(for: request) { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expentation.fulfill()
        }
        wait(for: [expentation], timeout: 5)
    }
    
    func testGetRecipeLikeRequest() throws {
        let expentation = expectation(description: "request expentation")
        let request = RecipeLikeRequest(recipeId: 0, likeType: .like)
        dataProvider.request(for: request) { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expentation.fulfill()
        }
        wait(for: [expentation], timeout: 5)
    }
    
    func testGetRecipeUnlikeRequest() throws {
        let expentation = expectation(description: "request expentation")
        let request = RecipeLikeRequest(recipeId: 0, likeType: .unlike)
        dataProvider.request(for: request) { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expentation.fulfill()
        }
        wait(for: [expentation], timeout: 5)
    }

}
