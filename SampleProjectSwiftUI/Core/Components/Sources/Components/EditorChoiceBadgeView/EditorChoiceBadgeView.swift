//
//  EditorChoiceBadgeView.swift
//  Components
//
//  Created by Mehmet Salih Aslan on 25.09.2025.
//

import SwiftUI

public struct EditorChoiceBadgeView: View {
    
    let size: CGFloat
    let padding: CGFloat
    
    public init(size: CGFloat = 40, padding: CGFloat = 16) {
        self.size = size
        self.padding = padding
    }
    
    public var body: some View {
        VStack {
            HStack {
                Spacer()
                Image.imgEditorsPick
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
            }
            
            Spacer()
        }
        .padding([.top, .trailing], padding)
    }
}

#Preview {
    EditorChoiceBadgeView(size: 40)
}
