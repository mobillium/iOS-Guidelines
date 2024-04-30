//
//  HorizontalRecipesView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 19.01.2023.
//

import SwiftUI

public struct HorizontalRecipesView: View {
    
    var viewModel: any HorizontalRecipesViewProtocol
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.viewModels) { viewModel in
                    HorizontalRecipeView(viewModel: viewModel)
                        .frame(width: (UIScreen.main.bounds.size.width - 48) / 2.12)
                }
            }
            .padding(16)
        }
        .background(Color.appPrimaryBackground)
    }
    
    public init(viewModel: any HorizontalRecipesViewProtocol) {
        self.viewModel = viewModel
    }
}

struct HorizontalRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        let userViewModel = UserViewModel(imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
                                          username: "fodamy",
                                          stat: "3 Tarif 0 Takipçi")
        let recipeViewModel = RecipeViewModel(userViewModel: userViewModel,
                                              name: "Tarhana Çorbası",
                                              category: "Hamur İşi",
                                              imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
                                              stat: "O Yorum O Beğeni",
                                              isEditorChoice: true)
        let viewModel = HorizontalRecipesViewModel(viewModels: [recipeViewModel, recipeViewModel, recipeViewModel, recipeViewModel])
        let view = HorizontalRecipesView(viewModel: viewModel)
        return view
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
