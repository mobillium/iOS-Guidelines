//
//  HorizontalRecipesViewModel.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 19.01.2023.
//

import Foundation
import Combine

public protocol HorizontalRecipesViewProtocol: Identifiable {
    var id: UUID { get }
    var viewModels: [RecipeViewModel] { get }
}

public class HorizontalRecipesViewModel: ObservableObject, HorizontalRecipesViewProtocol {
    
    public var id = UUID()
    @Published public var viewModels: [RecipeViewModel] = []
    
    public init(id: UUID = UUID(), viewModels: [RecipeViewModel]) {
        self.id = id
        self.viewModels = viewModels
    }
}
