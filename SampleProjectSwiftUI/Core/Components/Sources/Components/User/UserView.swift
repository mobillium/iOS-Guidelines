//
//  UserView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 24.11.2022.
//

import SwiftUI
import Kingfisher

public struct UserView: View {
    
    var viewModel: any UserViewProtocol
    
    public var body: some View {
        HStack {
            KFImage(URL(string: viewModel.imageUrl) ?? URL(string: "https://")!)
                .resizable()
                .frame(width: 40, height: 40)
                .background(Color.appSecondaryBackground)
                .clipShape(Circle())
            
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
