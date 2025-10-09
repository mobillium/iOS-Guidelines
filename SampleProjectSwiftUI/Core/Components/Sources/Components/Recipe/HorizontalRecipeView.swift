//
//  HorizontalRecipeView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 5.01.2023.
//

import SwiftUI

public struct HorizontalRecipeView: View {
    
    var viewModel: any RecipeViewProtocol
    let recipeDidTapped: ((Int) -> Void)?
    
    public init(viewModel: any RecipeViewProtocol, recipeDidTapped: ((Int) -> Void)?) {
        self.viewModel = viewModel
        self.recipeDidTapped = recipeDidTapped
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            AsyncImage(url: URL(string: viewModel.imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fit)
                        .cornerRadius(4)
                        .background(Color.appSecondaryBackground)
                        .clipped()
                        .transition(.opacity.animation(.easeIn(duration: 0.25)))
                case .failure:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1.0, contentMode: .fit)
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
                    .lineLimit(1)
                
                Text(viewModel.stat)
                    .font(.font(.nunitoSemiBold, size: .xLarge))
                    .foregroundColor(.appRaven)
            }
            .padding([.leading, .trailing], 8)
            .padding([.bottom, .top], 12)
            
        }
        .cornerRadius(6)
        .background(Color.appPrimaryBackground)
        .shadow(color: Color.appShadow.opacity(0.25),
                radius: 6.0,
                x: 0.0,
                y: 0.0)
        .onTapGesture {
            recipeDidTapped?(viewModel.recipeId)
        }
    }
}

struct HorizontalRecipeView_Previews: PreviewProvider {
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
        HorizontalRecipeView(viewModel: viewModel, recipeDidTapped: nil)
            .frame(width: 200)
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
