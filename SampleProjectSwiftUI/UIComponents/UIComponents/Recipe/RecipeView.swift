//
//  RecipeView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 24.11.2022.
//

import SwiftUI
import Kingfisher

public struct RecipeView: View {
    
    var viewModel: any RecipeViewProtocol
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            UserView(viewModel: viewModel.userViewModel)
                .padding(-16)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.appSeparator)
                .padding([.leading, .trailing], -16)
            
            VStack {
                Text(viewModel.name)
                    .font(.font(.nunitoBold, size: .xLarge))
                    .foregroundColor(.appCinder)
                
                Text(viewModel.name)
                    .font(.font(.nunitoSemiBold, size: .xLarge))
                    .foregroundColor(.appRaven)
            }
            
            KFImage(URL(string: viewModel.imageUrl) ?? URL(string: "https://"))
                .fade(duration: 0.15)
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .cornerRadius(4)
                .background(Color.appSecondaryBackground)
                .clipped()
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            if viewModel.isEditorChoice {
                                Image.imgEditorsPick
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                    .padding(.init(top: 8, leading: 8, bottom: 8, trailing: 8))
                                    .background(Color.appPrimaryBackground)
                                    .clipShape(Circle())
                            } else {
                                Rectangle()
                                    .frame(width: 0, height: 0)
                            }
                        }
                        .padding(.trailing, 15)

                        Spacer()
                    }
                        .padding(.top, 15)

                )
            
            Text(viewModel.stat)
                .font(.font(.nunitoSemiBold, size: .medium))
                .foregroundColor(.appRaven)
        }
        .padding(16)
        
    }
    
    public init(viewModel: any RecipeViewProtocol) {
        self.viewModel = viewModel
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let userViewModel = UserViewModel(imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
                                          username: "fodamy",
                                          stat: "3 Tarif 0 Takipçi")
        let viewModel = RecipeViewModel(userViewModel: userViewModel,
                                        name: "Tarhana Çorbası",
                                        category: "Hamur İşi",
                                        imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
                                        stat: "O Yorum O Beğeni",
                                        isEditorChoice: true)
        let view = RecipeView(viewModel: viewModel)
        return view
    }
}
