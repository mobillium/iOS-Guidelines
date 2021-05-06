//
//  RecipeComment.swift
//  DataProvider
//
//  Created by Emirhan Battalbaş on 6.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

// MARK: - RecipeComment
public struct RecipeComment: Codable {
    public let id: Int
    public let text, difference: String
    public let user: User?
}
