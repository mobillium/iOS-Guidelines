//
//  RecipeViewModel.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 24.11.2022.
//

import Foundation
import Combine

public protocol RecipeViewProtocol: Identifiable {
    var id: UUID { get }
    var userViewModel: UserViewModel { get }
    var name: String { get }
    var category: String { get }
    var imageUrl: String { get }
    var stat: String { get }
    var isEditorChoice: Bool { get }
}

public struct RecipeViewModel: RecipeViewProtocol {
    public var id = UUID()
    public var userViewModel: UserViewModel
    public var name: String
    public var category: String
    public var imageUrl: String
    public var stat: String
    public var isEditorChoice: Bool
    
    public init(userViewModel: UserViewModel, name: String, category: String, imageUrl: String, stat: String, isEditorChoice: Bool) {
        self.userViewModel = userViewModel
        self.name = name
        self.category = category
        self.imageUrl = imageUrl
        self.stat = stat
        self.isEditorChoice = isEditorChoice
    }
}
