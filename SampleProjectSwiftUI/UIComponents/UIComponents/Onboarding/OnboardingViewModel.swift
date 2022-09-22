//
//  OnboardingViewModel.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 22.09.2022.
//

import SwiftUI

public struct OnboardingViewModel: Identifiable {
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
