//
//  AuthDestinations.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 18.06.2026.
//

import SwiftUI

enum AuthDestinations: DestinationProtocol {
    case login
    case register
    case forgotPassword

    @MainActor
    @ViewBuilder
    var view: some View {
        switch self {
        case .login:
            LoginScene(viewModel: LoginSceneModel())
        case .register:
            RegisterScene(viewModel: RegisterSceneModel())
        case .forgotPassword:
            ForgotPasswordScene(viewModel: ForgotPasswordSceneModel())
        }
    }
}
