//
//  RecipeCommentView.swift
//  Components
//
//  Created by Ahmet İmirze on 11.12.2025.
//

import SwiftUI

public struct RecipeCommentView: View {
    
    var userName: String?
    var userImageUrl: String?
    var userStat: String
    var commentDate: String?
    var comment: String?
    
    public var body: some View {
        VStack {
            UserView(
                viewModel: UserViewModel(
                    imageUrl: userImageUrl,
                    username: userName,
                    stat: userStat,
                    imageSize: .small
                )
            )
            commentTextView
        }
        .background(Color.appPureWhite)
    }
    
    private var commentTextView: some View {
        VStack {
            if let commentDate {
                Text(commentDate)
                    .foregroundStyle(Color.appText)
                    .font(.font(.nunitoSemiBold, size: .large))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 16)
            }
            if let comment {
                Text(comment)
                    .foregroundStyle(Color.appFocus)
                    .font(.font(.nunitoSemiBold, size: .xLarge))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 16)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    VStack(spacing: 16) {
        Group {
            RecipeCommentView(
                userName: "Ali Kırcı",
                userImageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
                userStat: "3 Tarif 0 Takipçi",
                commentDate: "3 dakika önce",
                comment: "Güzel yemek beğendim bayıldım çok güzelllll"
            )
        }
    }
}
