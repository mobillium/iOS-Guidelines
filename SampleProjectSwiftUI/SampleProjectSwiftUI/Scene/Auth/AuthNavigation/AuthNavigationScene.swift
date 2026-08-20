//
//  AuthNavigationScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 9.04.2026.
//

import Router
import SwiftUI
import Components

struct AuthNavigationScene: View {

    @StateObject private var loginViewModel = LoginSceneModel()
    @ObservedObject var router = Router()
    
    @Environment(\.dismiss)
    private var dismiss

    var body: some View {
        NavigationStack(path: $router.navPath) {
            LoginScene(viewModel: loginViewModel)
                .navigationDestination(for: AuthDestinations.self)
        }
        .onReceive(NotificationCenter.default.publisher(for: .dismissAuth)) { _ in
            dismiss()
        }
        .installToast(position: .bottom)
        .environmentObject(router)
    }
}

#Preview {
    AuthNavigationScene()
}
