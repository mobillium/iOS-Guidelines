//
//  FollowButtonStyle.swift
//  Components
//
//  Created by Mehmet Salih Aslan on 13.11.2025.
//

import SwiftUI

public struct FollowButtonStyle: ButtonStyle {
    
    var isFollow: Bool
    
    public init(isFollow: Bool = false) {
        self.isFollow = isFollow
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 26)
            .padding(.horizontal, 20)
            .padding(.vertical, 4)
            .font(.font(.nunitoSemiBold, size: .medium))
            .foregroundColor(isFollow ? Color.appPureWhite : Color.appPrimary)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(isFollow ? Color.appPrimary : Color.clear)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.appPrimary, lineWidth: 1)
            )
    }
    
}

#Preview(traits: .sizeThatFitsLayout) {
    
    struct FollowButtonStylePreview: View {
        
        @State var isFollow1 = false
        @State var isFollow2 = true
        
        var body: some View {
            VStack(spacing: 16) {
                Group {
                    Button("Takip Et") {
                        
                    }
                    .buttonStyle(FollowButtonStyle(isFollow: isFollow1))
                    
                    Button("Takip Ediliyor") {
                        
                    }
                    .buttonStyle(FollowButtonStyle(isFollow: isFollow2))
                }
            }
        }
    }
    return FollowButtonStylePreview()
}
