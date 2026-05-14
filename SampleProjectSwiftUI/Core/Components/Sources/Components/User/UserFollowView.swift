//
//  UserFollowView.swift
//  Components
//
//  Created by Mehmet Salih Aslan on 13.11.2025.
//

import SwiftUI
import Domain

public struct UserFollowView: View {
    
    private var imageUrl: String?
    private var username: String?
    private var stat: String
    private var isFollowing: Bool
    private var onFollowTap: () -> Void
    
    public init(
        imageUrl: String?,
        username: String?,
        stat: String,
        isFollowing: Bool,
        onFollowTap: @escaping () -> Void = {}
    ) {
        self.imageUrl = imageUrl
        self.username = username
        self.stat = stat
        self.isFollowing = isFollowing
        self.onFollowTap = onFollowTap
    }
    
    public var body: some View {
        HStack {
            AsyncImage(url: URL(string: imageUrl ?? "")) { phase in
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
                Text(username ?? "")
                    .font(.font(.nunitoBold, size: .medium))
                    .foregroundColor(.appFocus)
                
                Text(stat)
                    .font(.font(.nunitoSemiBold, size: .medium))
                    .foregroundColor(.appText)
            }
            Spacer()
            
            Button(isFollowing ? "Takip Ediliyor" : "Takip Et") {
                onFollowTap()
            }
            .buttonStyle(FollowButtonStyle(isFollow: isFollowing))
        }
        .padding(16)
        .background(Color.appPureWhite)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    
    struct UserFollowViewPreview: View {
        var body: some View {
            VStack(spacing: 16) {
                Group {
                    UserFollowView(
                        imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
                        username: "fodamy",
                        stat: "50 Tarif 100 Takipçi",
                        isFollowing: true
                    )
                    UserFollowView(
                        imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
                        username: "fodamy",
                        stat: "50 Tarif 99 Takipçi",
                        isFollowing: false
                    )
                }
            }
        }
    }
    return UserFollowViewPreview()
    
}
