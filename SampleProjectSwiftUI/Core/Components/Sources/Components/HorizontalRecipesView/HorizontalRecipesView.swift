//
//  HorizontalRecipesView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 19.01.2023.
//

import SwiftUI

public struct HorizontalRecipesView: View {
    
    var viewModel: any HorizontalRecipesViewProtocol
    let recipeDidTapped: ((Int) -> Void)?
    
    public init(viewModel: any HorizontalRecipesViewProtocol,
                recipeDidTapped: ((Int) -> Void)?) {
        self.viewModel = viewModel
        self.recipeDidTapped = recipeDidTapped
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.viewModels) { viewModel in
                    HorizontalRecipeView(viewModel: viewModel, recipeDidTapped: recipeDidTapped)
                        .frame(width: (UIScreen.main.bounds.size.width - 48) / 2.12)
                }
            }
            .padding(16)
        }
        .background(Color.appPureWhite)
    }
}

struct HorizontalRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        let userViewModel = UserViewModel(imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
                                          username: "fodamy",
                                          stat: "3 Tarif 0 Takipçi")
        let recipeViewModel = RecipeViewModel(userViewModel: userViewModel,
                                              recipeId: 1,
                                              name: "Tarhana Çorbası",
                                              category: "Hamur İşi",
                                              imageUrl: "https://fodamy.mobillium.com/images/60b0be39-5534-48eb-a8ec-3b8741380182.jpg",
                                              stat: "O Yorum O Beğeni",
                                              isEditorChoice: true)
        let viewModel = HorizontalRecipesViewModel(viewModels: [recipeViewModel, recipeViewModel, recipeViewModel, recipeViewModel])
        let view = HorizontalRecipesView(viewModel: viewModel, recipeDidTapped: nil)
        return view
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
