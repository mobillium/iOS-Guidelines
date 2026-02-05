//
//  RecipeView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 24.11.2022.
//

import SwiftUI

public struct RecipeView: View {
        
    private var recipeId: Int
    private var name: String
    private var category: String
    private var imageUrl: String
    private var stat: String
    private var isEditorChoice: Bool
    private var userImageUrl: String?
    private var username: String?
    private var userStat: String
    private var userImageSize: UserViewImageSize
    
    public init(
        recipeId: Int,
        name: String,
        category: String,
        imageUrl: String,
        stat: String,
        isEditorChoice: Bool,
        userImageUrl: String?,
        username: String?,
        userStat: String,
        userImageSize: UserViewImageSize = .large
    ) {
        self.recipeId = recipeId
        self.name = name
        self.category = category
        self.imageUrl = imageUrl
        self.stat = stat
        self.isEditorChoice = isEditorChoice
        self.userImageUrl = userImageUrl
        self.username = username
        self.userStat = userStat
        self.userImageSize = userImageSize
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            UserView(
                imageUrl: userImageUrl,
                username: username,
                stat: userStat,
                imageSize: userImageSize
            )
            .padding(-16)
            
            Divider()
                .foregroundColor(.appElevation2)
                .padding([.leading, .trailing], -16)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.font(.nunitoBold, size: .xLarge))
                    .foregroundColor(.appFocus)
                
                Text(category)
                    .font(.font(.nunitoSemiBold, size: .xLarge))
                    .foregroundColor(.appText)
            }
            
            RecipeImageView(imageUrl: imageUrl)
                .cornerRadius(4)
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    ZStack {
                        if isEditorChoice {
                            EditorChoiceBadgeView()
                        }
                    }
                )
            
            Text(stat)
                .font(.font(.nunitoSemiBold, size: .medium))
                .foregroundColor(.appText)
        }
        .padding(16)
        .background(Color.appPureWhite)
        
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let view = RecipeView(
            recipeId: 19,
            name: "Tarhana Çorbası",
            category: "Hamur İşi",
            imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
            stat: "O Yorum O Beğeni",
            isEditorChoice: true,
            userImageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
            username: "fodamy",
            userStat: "3 Tarif 0 Takipçi"
        )
        return view
    }
}
