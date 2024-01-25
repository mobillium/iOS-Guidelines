//
//  OnboardingViewModel.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 22.09.2022.
//

import SwiftUI

public protocol OnboardingViewProtocol: Identifiable {
    var id: UUID { get }
    var imageName: String { get }
    var title: String { get }
    var description: String { get }
}

public struct OnboardingViewModel: OnboardingViewProtocol {
    public var id = UUID()
    public let imageName: String
    public let title: String
    public let description: String
    
    public init(imageName: String, title: String, description: String) {
        self.imageName = imageName
        self.title = title
        self.description = description
    }
}
