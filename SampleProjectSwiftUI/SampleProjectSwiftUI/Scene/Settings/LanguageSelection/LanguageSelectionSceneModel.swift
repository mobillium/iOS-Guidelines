//
//  LanguageSelectionSceneModel.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 30.07.2026.
//

import Combine
import LocalizationKit

class LanguageSelectionSceneModel: BaseSceneModel {

    let languages = AppLanguage.allCases

    @MainActor
    func select(_ language: AppLanguage) {
        LanguageManager.shared.setLanguage(language)
    }
}
