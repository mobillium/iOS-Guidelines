//
//  AuthSheetDestinations.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 9.04.2026.
//

import SwiftUI

enum AuthSheetDestinations: Identifiable {
    case login

    var id: String {
        switch self {
        case .login: return "login"
        }
    }

    @MainActor
    @ViewBuilder
    var view: some View {
        switch self {
        case .login:
            AuthNavigationScene()
        }
    }
}
