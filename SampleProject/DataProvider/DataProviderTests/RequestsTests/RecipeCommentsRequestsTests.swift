//
//  RecipeCommentsRequestsTests.swift
//  DataProviderTests
//
//  Created by Mehmet Salih Aslan on 29.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import XCTest

class RecipeCommentsRequestsTests: XCTestCase {
    
    let dataProvider = MockDataProvider()

    func testGetRecipeCommentsRequest() throws {
        let expentation = expectation(description: "request expentation")
        let request = GetRecipeCommentsRequest(recipeId: 1)
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
    
    func testPostRecipeCommentRequest() throws {
        let expentation = expectation(description: "request expentation")
        let request = PostRecipeCommentRequest(recipeId: 1, commentText: "test")
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
    
    func testEditRecipeCommentRequest() throws {
        let expentation = expectation(description: "request expentation")
        let request = EditRecipeCommentRequest(recipeId: 1, commentId: 1, commentText: "test")
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
    
    func testDeleteRecipeCommentRequest() throws {
        let expentation = expectation(description: "request expentation")
        let request = DeleteRecipeCommentRequest(recipeId: 1, commentId: 1)
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
