//
//  HorizontalRecipeView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 5.01.2023.
//

import SwiftUI

public struct HorizontalRecipeView: View {
    
    private var recipeId: Int
    private var name: String
    private var category: String
    private var imageUrl: String
    private var stat: String
    private var isEditorChoice: Bool
    private var userImageUrl: String?
    private var username: String?
    
    public init(
        recipeId: Int,
        name: String,
        category: String,
        imageUrl: String,
        stat: String,
        isEditorChoice: Bool,
        userImageUrl: String?,
        username: String?,
    ) {
        self.recipeId = recipeId
        self.name = name
        self.category = category
        self.imageUrl = imageUrl
        self.stat = stat
        self.isEditorChoice = isEditorChoice
        self.userImageUrl = userImageUrl
        self.username = username
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            AsyncImage(url: URL(string: imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fit)
                        .cornerRadius(4)
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
            .aspectRatio(1.0, contentMode: .fit)
            .overlay(
                VStack {
                    UserInfoView(
                        imageUrl: userImageUrl,
                        username: username,
                    )
                    .padding([.leading, .top], 8)
                    Spacer()
                }
            )
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.font(.nunitoBold, size: .xLarge))
                    .foregroundColor(.appFocus)
                    .lineLimit(1)
                
                Text(stat)
                    .font(.font(.nunitoSemiBold, size: .xLarge))
                    .foregroundColor(.appText)
            }
            .padding([.leading, .trailing], 8)
            .padding([.bottom, .top], 12)
            
        }
        .cornerRadius(6)
        .background(Color.appPureWhite)
        .shadow(color: Color.appFocus.opacity(0.25),
                radius: 6.0,
                x: 0.0,
                y: 0.0)
    }
}

struct HorizontalRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalRecipeView(
            recipeId: 19,
            name: "Tarhana Çorbası",
            category: "Hamur İşi",
            imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
            stat: "O Yorum O Beğeni",
            isEditorChoice: true,
            userImageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
            username: "fodamy",
        )
            .frame(width: 200)
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
