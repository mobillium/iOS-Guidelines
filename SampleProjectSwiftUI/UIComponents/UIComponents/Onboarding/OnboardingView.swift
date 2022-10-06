//
//  OnboardingView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 22.09.2022.
//

import SwiftUI

public struct OnboardingView: View {
    
    var viewModel: OnboardingViewModel
    
    public var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 64) {
                
                Image(viewModel.imageName, bundle: Bundle(identifier: "com.mobillium.UIComponents"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 10) {
                    Text(viewModel.title)
                        .foregroundColor(.appCinder)
                        .font(.font(.nunitoBold, size: .xxLarge))
                                    
                    Text(viewModel.description)
                        .foregroundColor(.appCinder)
                        .font(.font(.nunitoSemiBold, size: .xLarge))
                }
            }
            Spacer()
        }
    }
    
    public init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = OnboardingViewModel(imageName: "img_walkthrough_1",
                                            title: "this is title",
                                            description: "this is description")
        let view = OnboardingView(viewModel: viewModel)
        return view
    }
}
