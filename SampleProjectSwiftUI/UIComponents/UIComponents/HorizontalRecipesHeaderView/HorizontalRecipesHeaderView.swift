//
//  HorizontalRecipesHeaderView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 19.01.2023.
//

import SwiftUI
import Kingfisher

public struct HorizontalRecipesHeaderView: View {
    
    var viewModel: any HorizontalRecipesHeaderViewProtocol
    
    public var body: some View {
        HStack {
            HStack {
                KFImage(URL(string: viewModel.categoryImageUrl) ?? URL(string: "https://")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                
                Text(viewModel.title ?? "")
                    .font(.font(.nunitoBold, size: .xxLarge))
                    .foregroundColor(.appCinder)
            }

            Spacer()
            
            Button("TÜMÜNÜ GÖR") {
                
            }
            .foregroundColor(.appRed)
            .font(.font(.nunitoBold, size: .xxLarge))
        }
        .padding([.leading, .trailing], 16)
        .frame(height: 48)
        .background(Color.appPrimaryBackground)
    }
    
    public init(viewModel: any HorizontalRecipesHeaderViewProtocol) {
        self.viewModel = viewModel
    }
}

struct HorizontalRecipesHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HorizontalRecipesHeaderViewModel(
            categoryImageUrl: "https://fodamy.mobillium.com/images/96670e4a-6183-4ccc-bb63-472a41a3b67f.jpg",
            title: "Tatlı")
        let view = HorizontalRecipesHeaderView(viewModel: viewModel)
        return view
            .previewLayout(PreviewLayout.sizeThatFits)
            .frame(width: UIScreen.main.bounds.size.width)
    }
}
