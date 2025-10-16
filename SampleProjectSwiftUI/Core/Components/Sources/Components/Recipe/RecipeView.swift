//
//  RecipeView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 24.11.2022.
//

import SwiftUI

public struct RecipeView: View {
    
    var viewModel: any RecipeViewProtocol
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            UserView(viewModel: viewModel.userViewModel)
                .padding(-16)
            
            Divider()
                .foregroundColor(.appElevation2)
                .padding([.leading, .trailing], -16)
            
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.font(.nunitoBold, size: .xLarge))
                    .foregroundColor(.appFocus)
                
                Text(viewModel.category)
                    .font(.font(.nunitoSemiBold, size: .xLarge))
                    .foregroundColor(.appText)
            }
            
            RecipeImageView(imageUrl: viewModel.imageUrl)
                .cornerRadius(4)
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    ZStack {
                        if viewModel.isEditorChoice {
                            EditorChoiceBadgeView()
                        }
                    }
                )
            
            Text(viewModel.stat)
                .font(.font(.nunitoSemiBold, size: .medium))
                .foregroundColor(.appText)
        }
        .padding(16)
        .background(Color.appPureWhite)
        
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
                                        recipeId: 19,
                                        name: "Tarhana Çorbası",
                                        category: "Hamur İşi",
                                        imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
                                        stat: "O Yorum O Beğeni",
                                        isEditorChoice: true)
        let view = RecipeView(viewModel: viewModel)
        return view
    }
}
