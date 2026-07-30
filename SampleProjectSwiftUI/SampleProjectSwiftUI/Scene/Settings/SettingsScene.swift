//
//  SettingsScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 30.07.2026.
//

import Combine
import SwiftUI
import Components
import Router
import LocalizationKit

struct SettingsScene<ViewModel: SettingsSceneModel>: View {

    @StateObject var viewModel: ViewModel
    @ObservedObject var router = Router()
    @EnvironmentObject private var languageManager: LanguageManager

    var body: some View {
        NavigationStack(path: $router.navPath) {
            BaseScene(content: {
                List {
                    Button {
                        router.navigate(to: SettingsDestinations.languageSelection)
                    } label: {
                        HStack {
                            Text(L10n.Settings.language)
                                .font(.font(.nunitoBold, size: .xLarge))
                                .foregroundColor(.appFocus)
                            Spacer()
                            Text(languageManager.current.displayName)
                                .font(.font(.nunitoBold, size: .xLarge))
                                .foregroundColor(.appText)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.appText)
                        }
                        .contentShape(Rectangle())
                    }
                }
                .listStyle(.insetGrouped)
            }, viewModel: viewModel)
            .navigationDestination(for: SettingsDestinations.self)
            .background(Color.appElevation1)
            .navigationTitle(L10n.Settings.title)
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(router)
    }
}

#Preview {
    let viewModel = SettingsSceneModel()
    return SettingsScene(viewModel: viewModel)
        .environmentObject(LanguageManager.shared)
}
