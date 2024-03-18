//
//  HorizontalRecipesHeaderViewModel.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 19.01.2023.
//

import Foundation
import Combine

public protocol HorizontalRecipesHeaderViewProtocol: Identifiable {
    var id: UUID { get }
    var categoryImageUrl: String { get }
    var title: String? { get }
}

public struct HorizontalRecipesHeaderViewModel: HorizontalRecipesHeaderViewProtocol {
    public var id = UUID()
    public var categoryImageUrl: String
    public var title: String?
    
    public init(id: UUID = UUID(), categoryImageUrl: String, title: String? = nil) {
        self.id = id
        self.categoryImageUrl = categoryImageUrl
        self.title = title
    }
}
