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
            AsyncImage(url: URL(string: viewModel.imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .background(Color.appSecondaryBackground)
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
                Text(viewModel.username)
                    .font(.font(.nunitoBold, size: .medium))
                    .foregroundColor(.appCinder)
                
                Text(viewModel.stat)
                    .font(.font(.nunitoSemiBold, size: .medium))
                    .foregroundColor(.appRaven)
            }
            Spacer()
        }
        .padding(16)
    }
    
    public init(viewModel: any UserViewProtocol) {
        self.viewModel = viewModel
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = UserViewModel(imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
                                      username: "fodamy",
                                      stat: "3 Tarif 0 Takipçi")
        let view = UserView(viewModel: viewModel)
        return view
    }
}
