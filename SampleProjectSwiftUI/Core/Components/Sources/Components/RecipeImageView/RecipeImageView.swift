//
//  RecipeImageView.swift
//  Components
//
//  Created by Mehmet Salih Aslan on 25.09.2025.
//

import SwiftUI

public struct RecipeImageView: View {
    
    private let imageUrl: String
    
    public init(imageUrl: String) {
        self.imageUrl = imageUrl
    }
    
    public var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .background(Color.appElevation1)
                    .clipped()
                    .transition(.opacity.animation(.easeIn(duration: 0.25)))
            case .failure:
                EmptyView()
            @unknown default:
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    RecipeImageView(imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg")
}
