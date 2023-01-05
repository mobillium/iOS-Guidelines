//
//  UserInfoView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 5.01.2023.
//

import SwiftUI
import Kingfisher

public struct UserInfoView: View {
    
    var viewModel: any UserViewProtocol
    
    public var body: some View {
        HStack(spacing: 0) {
            KFImage(URL(string: viewModel.imageUrl) ?? URL(string: "https://")!)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(20)
                .background(Color.appSecondaryBackground)
                .clipShape(Circle())
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.appRed, lineWidth: 1))
            
            Rectangle()
                .frame(width: 22, height: 20)
                .padding(.leading, -20)
                .foregroundColor(Color.appRed)
                .zIndex(-1)
                
            ZStack {
                Text(viewModel.username)
                    .font(.font(.nunitoBold, size: .medium))
                    .foregroundColor(.appWhite)
            }
            .frame(height: 20)
            .padding(.trailing, 2)
            .background(Color.appRed)
            .cornerRadius(6, corners: [.topRight, .bottomRight])

            Spacer()
        }
    }
    
    public init(viewModel: any UserViewProtocol) {
        self.viewModel = viewModel
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = UserViewModel(imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
                                      username: "fodamy",
                                      stat: "3 Tarif 0 Takipçi")
        let view = UserInfoView(viewModel: viewModel)
        return view
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
