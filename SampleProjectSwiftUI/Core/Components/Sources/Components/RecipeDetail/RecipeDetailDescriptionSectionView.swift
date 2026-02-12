//
//  RecipeDetailDescriptionSectionView.swift
//  Components
//
//  Created by Ahmet İmirze on 27.11.2025.
//

import SwiftUI
import AssetsKit

public struct RecipeDetailDescriptionSectionView: View {
    
    var title: String
    var topRightImageName: String
    var topRightText: String
    var contentText: String
    
    public init(title: String, topRightImageName: String, topRightText: String, contentText: String) {
        self.title = title
        self.topRightImageName = topRightImageName
        self.topRightText = topRightText
        self.contentText = contentText
    }
    
    public var body: some View {
        VStack(spacing: 12) {
            topContent
            Divider()
            contentTextView
        }
        .padding(.vertical, 12)
        .background(Color.appPureWhite)
    }
    
    private var topContent: some View {
        HStack(spacing: 12) {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
            Image(topRightImageName, bundle: .assetsKit)
                .resizable()
                .frame(width: 20, height: 20)
                .aspectRatio(contentMode: .fit)
                .tint(.appFocus)
            Text(topRightText)
        }
        .padding(.horizontal, 20)
    }
    
    private var contentTextView: some View {
        Text(contentText)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 20)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    VStack(spacing: 16) {
        Group {
            RecipeDetailDescriptionSectionView(
                title: "Malzemeler",
                topRightImageName: "ic_restaurant",
                topRightText: "4-6",
                contentText: """
                    8 su bardağı su
                    1 silme yemek kaşığı tuz
                    250 gram makarna (yarım paket)
                    3 yemek kaşığı sıvı yağ
                    Krema
                    Tavuk
                    """
            )
            RecipeDetailDescriptionSectionView(
                title: "Yapılışı",
                topRightImageName: "ic_clock",
                topRightText: "4-6",
                contentText: """
                    Öncelikle tencereye 8 bardak suyu ekleyin. Kaynaya suyun içerisinde tuzu ve sıvı yağı ekleyerek kaynaya kadar kapağı kapalı bir şekilde bekleyin.
                    
                    Afiyet olsun...
                    """
            )
        }
    }
}
