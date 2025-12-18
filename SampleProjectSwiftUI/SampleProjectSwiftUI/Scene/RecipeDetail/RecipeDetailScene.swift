//
//  RecipeDetailScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 15.02.2024.
//

import Combine
import SwiftUI
import Components

struct RecipeDetailScene<ViewModel: RecipeDetailSceneModel>: View {
    
    @StateObject var viewModel: ViewModel
    @State private var currentPage: Int = 0
    
    var body: some View {
        BaseScene(content: {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    imagesView
                    headerView
                    Divider()
                    statsView
                    
                    Spacer(minLength: 20)
                    
                    if let user = viewModel.user {
                        UserFollowView(user: user, stat: "\(user.recipeCount) Tarif \(user.followedCount) Takipçi")
                    }
                    
                    Spacer(minLength: 20)
                    
                    ingredientsView
                    
                    Spacer(minLength: 20)
                    
                    instructionsView
                    
                    Spacer(minLength: 20)
                    
                    recipeCommentsView
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }, viewModel: viewModel)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            Task { @MainActor in
                await viewModel.fetchRecipe()
            }
        }
        .navigationTitle(viewModel.recipeName)
        .background(Color.appElevation1)
    }
    
    var imagesView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            TabView(selection: $currentPage) {
                ForEach(viewModel.images.indices, id: \.self) { index in
                    let imageModel = viewModel.images[index]
                    let imageUrl = imageModel.url ?? ""
                    RecipeImageView(imageUrl: imageUrl)
                        .tag(index)
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            .frame(height: UIScreen.main.bounds.width)
            .tabViewStyle(.page(indexDisplayMode: .automatic))
        }
        .scrollDisabled(true)
        .overlay(
            ZStack {
                if viewModel.isEditorChoice {
                    EditorChoiceBadgeView()
                }
            }
        )
    }
    
    var headerView: some View {
        HStack(alignment: .center) {
            VStack {
                Text(viewModel.recipeName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.font(.nunitoBold, size: .xxLarge))
                    .foregroundStyle(Color.appFocus)
                    .lineLimit(0)
                
                Text(viewModel.categoryName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.font(.nunitoBold, size: .large))
                    .foregroundStyle(Color.appText)
            }
            .padding(.leading, 20)
            
            Spacer()
            
            Text(viewModel.timeStamp)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 20)
                .font(.font(.nunitoBold, size: .xxLarge))
                .foregroundStyle(Color.appText)
        }
        .padding([.top, .bottom], 12)
        .background(Color.appPureWhite)
    }
    
    var statsView: some View {
        HStack(alignment: .center) {
            StatView(imageName: "ic_comment", count: viewModel.commentCount, stat: "Yorum")
                .frame(maxWidth: .infinity)
            Divider()
            StatView(imageName: "ic_heart", count: viewModel.likeCount, stat: "Beğeni")
                .frame(maxWidth: .infinity)
        }
        .background(Color.appPureWhite)
    }
    
    var ingredientsView: some View {
        RecipeDetailDescriptionSectionView(
            title: viewModel.ingredientsTitle,
            topRightImageName: viewModel.ingredientsIconName,
            topRightText: viewModel.numberOfPerson,
            contentText: viewModel.ingredients
        )
    }
    
    var instructionsView: some View {
        RecipeDetailDescriptionSectionView(
            title: viewModel.instructionsTitle,
            topRightImageName: viewModel.instructionsIconName,
            topRightText: viewModel.timeOfRecipe,
            contentText: viewModel.instructions
        )
    }
    
    var recipeCommentsView: some View {
        RecipeDetailCommentsSectionView(
            title: "Yorumlar",
            recipeComments: Array(viewModel.recipeComments.prefix(3))
        )
    }
}

#Preview {
    let viewModel = RecipeDetailSceneModel(recipeId: 5)
    return RecipeDetailScene(viewModel: viewModel)
}
