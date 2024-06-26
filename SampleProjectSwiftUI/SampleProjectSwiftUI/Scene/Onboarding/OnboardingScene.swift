//
//  OnboardingScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 22.09.2022.
//

import UIKit
import SwiftUI
import MobilliumUserDefaults
import Components

struct OnboardingScene<ViewModel: OnboardingSceneModel>: View {
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @ObservedObject var viewModel: ViewModel
    @State private var buttonTitle: String = L10n.Modules.WalkThrough.next
    @State private var currentPage: Int = 0
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        setupAppearance()
    }
    
    var body: some View {
        BaseScene(content: {
            ZStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    TabView(selection: $currentPage) {
                        ForEach(viewModel.items.indices, id: \.self) { index in
                            let viewModel = viewModel.items[index]
                            OnboardingView(viewModel: viewModel)
                                .padding(50)
                        }
                    }
                    .onChange(of: currentPage, perform: { _ in
                        updateButtonTitle()
                    })
                    .frame(width: UIScreen.main.bounds.width)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
                
                VStack {
                    Spacer()
                    
                    PageControl(numberOfPages: viewModel.numberOfPages, currentPage: $currentPage)
                    Button(buttonTitle) {
                        if currentPage >= viewModel.numberOfPages - 1 {
                            DefaultsKey.isFirstStart.value = false
                            let viewModel = MainTabSceneModel(dataProvider: apiDataProvider)
                            RootSceneModel.shared.state = .mainTab(viewModel: viewModel)
                        } else {
                            currentPage += 1
                            updateButtonTitle()
                        }
                    }
                    .buttonStyle(PrimaryLargeButton())
                }
                .padding([.leading, .trailing], 16)
                .padding(.bottom, safeAreaInsets.bottom > 0 ? 0 : 16)
            }
        }, viewModel: viewModel)
    }
    
    private func updateButtonTitle() {
        if currentPage < viewModel.numberOfPages - 1 {
            self.buttonTitle = L10n.Modules.WalkThrough.next
        } else {
            self.buttonTitle = L10n.Modules.WalkThrough.start
        }
    }
    
    func setupAppearance() {
        UIScrollView.appearance().bounces = false
        UIPageControl.appearance().currentPageIndicatorTintColor = Color.appRed.uiColor
        UIPageControl.appearance().pageIndicatorTintColor = Color.appRed.uiColor.withAlphaComponent(0.3)
    }
}

#Preview {
    let viewModel = OnboardingSceneModel(dataProvider: apiDataProvider)
    let view = OnboardingScene(viewModel: viewModel)
        .previewDevice(PreviewDevice(stringLiteral: DeviceName.iPhone_SE.rawValue))
    return view
}
