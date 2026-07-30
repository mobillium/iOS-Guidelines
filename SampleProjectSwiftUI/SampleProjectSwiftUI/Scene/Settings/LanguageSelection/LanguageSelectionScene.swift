//
//  LanguageSelectionScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 30.07.2026.
//

import Combine
import SwiftUI
import Components
import Router
import LocalizationKit

struct LanguageSelectionScene<ViewModel: LanguageSelectionSceneModel>: View {

    @StateObject var viewModel: ViewModel
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var languageManager: LanguageManager

    var body: some View {
        BaseScene(content: {
            List {
                ForEach(viewModel.languages) { language in
                    Button {
                        viewModel.select(language)
                        router.navigateBack()
                    } label: {
                        HStack {
                            Text(language.displayName)
                                .foregroundColor(.appFocus)
                            Spacer()
                            if language == languageManager.current {
                                Image(systemName: "checkmark")
                                    .font(.font(.nunitoBold, size: .xxLarge))
                                    .foregroundColor(.appFocus)
                            }
                        }
                        .contentShape(Rectangle())
                    }
                }
            }
            .listStyle(.insetGrouped)
        }, viewModel: viewModel)
        .background(Color.appElevation1)
        .navigationTitle(L10n.LanguageSelection.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let viewModel = LanguageSelectionSceneModel()
    return LanguageSelectionScene(viewModel: viewModel)
        .environmentObject(Router())
        .environmentObject(LanguageManager.shared)
}
