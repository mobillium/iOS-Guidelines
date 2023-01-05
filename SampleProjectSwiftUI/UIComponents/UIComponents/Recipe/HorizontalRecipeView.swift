//
//  HorizontalRecipeView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 5.01.2023.
//

import SwiftUI
import Kingfisher

public struct HorizontalRecipeView: View {
    
    var viewModel: any RecipeViewProtocol
    
    public var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: viewModel.imageUrl) ?? URL(string: "https://"))
                .fade(duration: 0.15)
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .cornerRadius(4)
                .background(Color.appSecondaryBackground)
                .clipped()
                .overlay(
                    VStack {
                        UserInfoView(viewModel: viewModel.userViewModel)
                            .padding([.leading, .top], 8)
                        Spacer()
                    }
                )
            
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.font(.nunitoBold, size: .xLarge))
                    .foregroundColor(.appCinder)
                
                Text(viewModel.stat)
                    .font(.font(.nunitoSemiBold, size: .xLarge))
                    .foregroundColor(.appRaven)
            }
        }
        
        .cornerRadius(6)
        .shadow(color: Color.appShadow.opacity(0.2), radius: 6, x: 0, y: 0)
    }
    
    public init(viewModel: any RecipeViewProtocol) {
        self.viewModel = viewModel
    }
}

struct HorizontalRecipeView_Previews: PreviewProvider {
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
        HorizontalRecipeView(viewModel: viewModel)
            .frame(width: 200)
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
