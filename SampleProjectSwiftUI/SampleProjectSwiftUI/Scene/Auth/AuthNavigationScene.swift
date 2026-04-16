//
//  AuthNavigationScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 9.04.2026.
//

import SwiftUI
import Components

struct AuthNavigationScene: View {

    @StateObject private var loginViewModel = LoginSceneModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            LoginScene(viewModel: loginViewModel)
        }
        .onAppear {
            loginViewModel.onLoginSuccess = {
                dismiss()
            }
        }
    }
}

#Preview {
    AuthNavigationScene()
}
