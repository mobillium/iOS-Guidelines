//
//  RecipeViewModel.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 24.11.2022.
//

import Foundation
import Combine

public protocol RecipeViewProtocol: Identifiable {
    var id: Int { get }
    var recipeId: Int { get }
    var name: String { get }
    var category: String { get }
    var imageUrl: String { get }
    var stat: String { get }
    var isEditorChoice: Bool { get }
}

public struct RecipeViewModel: RecipeViewProtocol {
    public var id: Int
    public var recipeId: Int
    public var name: String
    public var category: String
    public var imageUrl: String
    public var stat: String
    public var isEditorChoice: Bool
    public var userImageUrl: String?
    public var username: String?
    
    public init(
        recipeId: Int,
        name: String,
        category: String,
        imageUrl: String,
        stat: String,
        isEditorChoice: Bool,
        userImageUrl: String?,
        username: String?
    ) {
        self.id = recipeId
        self.recipeId = recipeId
        self.name = name
        self.category = category
        self.imageUrl = imageUrl
        self.stat = stat
        self.isEditorChoice = isEditorChoice
        self.userImageUrl = userImageUrl
        self.username = username
    }
}
