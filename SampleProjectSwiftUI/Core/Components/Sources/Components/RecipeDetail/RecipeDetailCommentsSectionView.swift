//
//  RecipeDetailCommentsSectionView.swift
//  Components
//
//  Created by Ahmet İmirze on 11.12.2025.
//


import SwiftUI
import Domain

public struct RecipeDetailCommentsSectionView: View {
    
    var title: String
    var recipeComments: [RecipeComment]
    
    public init(title: String, recipeComments: [RecipeComment]) {
        self.title = title
        self.recipeComments = Array(recipeComments)
    }
    
    public var body: some View {
        VStack {
            topContent
            Divider()
            content
        }
        .background(Color.appPureWhite)
    }
    
    private var topContent: some View {
        HStack(spacing: 12) {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
        }
        .padding(.horizontal, 20)
    }
    
    private var content: some View {
        VStack {
            ForEach(recipeComments, id: \.id) { recipe in
                RecipeCommentView(
                    userName: recipe.user.username,
                    userImageUrl: recipe.user.image?.url,
                    userStat: "\(recipe.user.recipeCount) Tarif \(recipe.user.followedCount) Takipçi",
                    commentDate: recipe.timeDifference,
                    comment: recipe.text
                )
                Divider()
                    .padding(.horizontal, 16)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    VStack(spacing: 16) {
        Group {
            RecipeDetailCommentsSectionView(
                title: "Yorumlar",
                recipeComments: [
                    RecipeComment(
                        id: 0,
                        text: "Güzel yemekmiş",
                        timeDifference: "3 dakika önce",
                        user: User(
                            id: 1,
                            username: "fodamy",
                            image: ImageModel(url: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg"),
                            followedCount: 100,
                            followingCount: 99,
                            recipeCount: 50,
                            isFollowing: true,
                            favoritesCount: 2323,
                            likesCount: 3434
                        )
                    ),
                    RecipeComment(
                        id: 1,
                        text: "Güzel yemekmiş kenk",
                        timeDifference: "3 dakika önce",
                        user: User(
                            id: 1,
                            username: "fodamy",
                            image: ImageModel(url: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg"),
                            followedCount: 100,
                            followingCount: 99,
                            recipeCount: 50,
                            isFollowing: true,
                            favoritesCount: 2323,
                            likesCount: 3434
                        )
                    ),
                    RecipeComment(
                        id: 2,
                        text: "Çok kötü yemek kim yapmış bunu",
                        timeDifference: "3 dakika önce",
                        user: User(
                            id: 1,
                            username: "fodamy",
                            image: ImageModel(url: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg"),
                            followedCount: 100,
                            followingCount: 99,
                            recipeCount: 50,
                            isFollowing: true,
                            favoritesCount: 2323,
                            likesCount: 3434
                        )
                    )
                ]
            )
        }
    }
}
