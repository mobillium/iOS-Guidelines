//
//  SettingsDestinations.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 30.07.2026.
//

import SwiftUI

enum SettingsDestinations: DestinationProtocol {
    case languageSelection

    @MainActor
    @ViewBuilder
    var view: some View {
        switch self {
        case .languageSelection:
            LanguageSelectionScene(viewModel: LanguageSelectionSceneModel())
        }
    }
}
