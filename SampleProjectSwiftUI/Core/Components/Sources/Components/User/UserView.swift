//
//  UserView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 24.11.2022.
//

import SwiftUI

public struct UserView: View {
    
    private var imageUrl: String?
    private var username: String?
    private var stat: String
    private var imageSize: UserViewImageSize
    
    public init (
        imageUrl: String?,
        username: String?,
        stat: String,
        imageSize: UserViewImageSize = .large
    ) {
        self.imageUrl = imageUrl
        self.username = username
        self.stat = stat
        self.imageSize = imageSize
    }
    
    public var body: some View {
        HStack {
            if let imageUrl {
                AsyncImage(url: URL(string: imageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: imageSize.cgFloatValue, height: imageSize.cgFloatValue)
                            .background(Color.appElevation1)
                            .clipShape(Circle())
                            .transition(.opacity.animation(.easeIn(duration: 0.25)))
                        
                    case .failure:
                        EmptyView()
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: imageSize.cgFloatValue, height: imageSize.cgFloatValue)
            }
            VStack(alignment: .leading) {
                if let username {
                    Text(username)
                        .font(.font(.nunitoBold, size: .medium))
                        .foregroundColor(.appFocus)
                }
                Text(stat)
                    .font(.font(.nunitoSemiBold, size: .medium))
                    .foregroundColor(.appText)
            }
            Spacer()
        }
        .padding(16)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    struct UserViewPreview: View {
        var body: some View {
            VStack(spacing: 0) {
                UserView(
                    imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
                    username: "fodamy",
                    stat: "3 Tarif 0 Takipçi"
                )
                Divider()
                UserView(
                    imageUrl: nil,
                    username: "fodamy",
                    stat: "3 Tarif 0 Takipçi"
                )
            }
            
        }
    }
    return UserViewPreview()
    
}
