//
//  PrimaryLargeButton.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 6.10.2022.
//

import SwiftUI

public struct PrimaryLargeButton: ButtonStyle {
    
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 60)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .background(Color.appPrimary)
            .foregroundColor(Color.appPureWhite)
            .font(.font(.nunitoBold, size: .xLarge))
            .cornerRadius(4)
    }
    
}

#Preview {
    Button("press me") {
        
    }
    .buttonStyle(PrimaryLargeButton())
}
