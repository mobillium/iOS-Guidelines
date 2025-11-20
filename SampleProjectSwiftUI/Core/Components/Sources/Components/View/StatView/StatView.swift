//
//  StatView.swift
//  Components
//
//  Created by Mehmet Salih Aslan on 20.11.2025.
//

import SwiftUI
import Utilities

public struct StatView: View {
    
    var imageName: String
    var count: Int
    var stat: String
    
    public init(imageName: String, count: Int, stat: String) {
        self.imageName = imageName
        self.count = count
        self.stat = stat
    }
    
    public var body: some View {
        VStack(spacing: 4) {
            Image(imageName, bundle: .module)
                .resizable()
                .frame(width: 20, height: 20)
                .aspectRatio(contentMode: .fit)
                .tint(.appFocus)
            
            HStack(spacing: 2) {
                Text(count.toString)
                    .foregroundColor(.appPrimary)
                    .font(.font(.nunitoSemiBold, size: .xxLarge))
                    .lineLimit(1)
                
                Text(stat)
                    .foregroundColor(.appText)
                    .font(.font(.nunitoSemiBold, size: .xSmall))
                    .lineLimit(1)
            }
        }
        .padding(8)
        .background(Color.appPureWhite)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StatView(imageName: "ic_comment", count: 1, stat: "Yorum")
}
