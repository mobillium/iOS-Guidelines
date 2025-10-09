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
                VStack {
                    imagesView
                    headerView
                    Divider()
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }, viewModel: viewModel)
        .onAppear {
            Task { @MainActor in
                await viewModel.fetchRecipe()
            }
        }
        .navigationTitle(viewModel.recipeName)
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
    }
}

#Preview {
    let viewModel = RecipeDetailSceneModel(recipeId: 1)
    return RecipeDetailScene(viewModel: viewModel)
}
