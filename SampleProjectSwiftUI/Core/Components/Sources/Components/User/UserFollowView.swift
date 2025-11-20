//
//  UserFollowView.swift
//  Components
//
//  Created by Mehmet Salih Aslan on 13.11.2025.
//

import SwiftUI
import Domain

public struct UserFollowView: View {
    
    var user: User
    var stat: String
    
    public init(user: User, stat: String) {
        self.user = user
        self.stat = stat
    }
    
    public var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.image?.url ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .background(Color.appElevation1)
                        .clipShape(Circle())
                        .transition(.opacity.animation(.easeIn(duration: 0.25)))
                    
                case .failure:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(user.username ?? "")
                    .font(.font(.nunitoBold, size: .medium))
                    .foregroundColor(.appFocus)
                
                Text(stat)
                    .font(.font(.nunitoSemiBold, size: .medium))
                    .foregroundColor(.appText)
            }
            Spacer()
            
            Button("Takip Et") {
                
            }
            .buttonStyle(FollowButtonStyle(isFollow: user.isFollowing))
        }
        .padding(16)
        .background(Color.appPureWhite)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    
    struct UserFollowViewPreview: View {
        let userFollowed = User(id: 1,
                                username: "fodamy",
                                image: ImageModel(url: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg"),
                                followedCount: 100,
                                followingCount: 99,
                                recipeCount: 50,
                                isFollowing: true,
                                favoritesCount: 2323,
                                likesCount: 3434)
        
        let userNotFollowed = User(id: 1,
                                   username: "fodamy",
                                   image: ImageModel(url: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg"),
                                   followedCount: 100,
                                   followingCount: 99,
                                   recipeCount: 50,
                                   isFollowing: false,
                                   favoritesCount: 2323,
                                   likesCount: 3434)
        
        var body: some View {
            VStack(spacing: 16) {
                Group {
                    UserFollowView(user: userFollowed,
                                   stat: "\(userFollowed.recipeCount) Tarif \(userFollowed.followedCount) Takipçi")
                    UserFollowView(user: userNotFollowed,
                                   stat: "\(userNotFollowed.recipeCount) Tarif \(userNotFollowed.followedCount) Takipçi")
                }
            }
        }
    }
    return UserFollowViewPreview()
    
}
