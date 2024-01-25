//
//  FullScreenLoadingView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 15.09.2022.
//

import SwiftUI

public struct FullScreenLoadingView: View {
    
    public init() {
        UIView.setAnimationsEnabled(false)
    }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea(.all)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
        }
        .onDisappear {
            UIView.setAnimationsEnabled(true)
        }
    }
}

struct FullScreenLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenLoadingView()
    }
}
