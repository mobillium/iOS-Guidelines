//
//  UserView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 24.11.2022.
//

import SwiftUI

public struct UserView: View {
    
    var viewModel: any UserViewProtocol
    
    public var body: some View {
        HStack {
            if let imageUrl = viewModel.imageUrl {
                AsyncImage(url: URL(string: imageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: self.viewModel.imageSize.cgFloatValue, height: self.viewModel.imageSize.cgFloatValue)
                            .background(Color.appElevation1)
                            .clipShape(Circle())
                            .transition(.opacity.animation(.easeIn(duration: 0.25)))
                        
                    case .failure:
                        EmptyView()
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: viewModel.imageSize.cgFloatValue, height: viewModel.imageSize.cgFloatValue)
            }
            VStack(alignment: .leading) {
                if let username = viewModel.username {
                    Text(username)
                        .font(.font(.nunitoBold, size: .medium))
                        .foregroundColor(.appFocus)
                }
                Text(viewModel.stat)
                    .font(.font(.nunitoSemiBold, size: .medium))
                    .foregroundColor(.appText)
            }
            Spacer()
        }
        .padding(16)
    }
    
    public init(viewModel: any UserViewProtocol) {
        self.viewModel = viewModel
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    struct UserViewPreview: View {
        let viewModel = UserViewModel(
            imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
            username: "fodamy",
            stat: "3 Tarif 0 Takipçi"
        )
        
        var body: some View {
            UserView(viewModel: viewModel)
        }
    }
    return UserViewPreview()

}
