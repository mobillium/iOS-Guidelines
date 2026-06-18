//
//  RegisterScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 18.06.2026.
//

import Combine
import SwiftUI
import AssetsKit
import Components
import Router
import LocalizationKit

struct RegisterScene<ViewModel: RegisterSceneModel>: View {

    @ObservedObject var viewModel: ViewModel
    @EnvironmentObject private var router: Router

    var body: some View {
        BaseScene(content: {
            VStack(spacing: .zero) {
                HStack(spacing: .zero) {
                    Button(action: {
                        router.navigateBack()
                    }) {
                        Image("ic_back", bundle: Bundle.assetsKit)
                            .tint(Color.appText)
                            .frame(width: 48, height: 48)
                    }
                    .padding([.leading], -18.5)
                    Spacer()
                }
                .padding([.leading], 16)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: .zero) {
                        headerView

                        Spacer(minLength: 32)

                        emailFieldView

                        Spacer(minLength: 20)

                        usernameFieldView

                        Spacer(minLength: 20)

                        passwordFieldView

                        Spacer(minLength: 32)

                        registerButton
                    }
                    .padding([.top, .leading, .trailing], 16)
                }
                Spacer()

                bottomSignInSection
            }
        }, viewModel: viewModel)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.appElevation1)
        .navigationBarHidden(true)
    }

    // MARK: - Header View
    private var headerView: some View {
        Text(L10n.Register.title)
            .font(.font(.nunitoBold, size: .xxLarge))
            .foregroundColor(.appFocus)
            .frame(maxWidth: .infinity, alignment: .center)
    }

    // MARK: - Email Field View
    private var emailFieldView: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image("ic_mail", bundle: .assetsKit)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.appText)

                TextField("E-posta", text: $viewModel.email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .onChange(of: viewModel.email) {
                        viewModel.validateEmail()
                    }
                    .foregroundColor(.appText)
                    .font(.font(.nunitoSemiBold, size: .xxLarge))
            }
            .frame(height: 56)
            .padding([.leading, .trailing], 12)
            .background(Color.clear)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        viewModel.emailError != nil ? Color.appPrimary : Color.appElevation2,
                        lineWidth: 2
                    )
            )

            if let emailError = viewModel.emailError {
                Text(emailError)
                    .font(.font(.nunitoSemiBold, size: .medium))
                    .foregroundColor(.appPrimary)
                    .lineLimit(1)
            }
        }
    }

    // MARK: - Username Field View
    private var usernameFieldView: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image("ic_user", bundle: .assetsKit)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.appText)

                TextField("Kullanıcı Adı", text: $viewModel.username)
                    .textContentType(.username)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .onChange(of: viewModel.username) {                        viewModel.validateUsername()
                    }
                    .foregroundColor(.appText)
                    .font(.font(.nunitoSemiBold, size: .xxLarge))
            }
            .frame(height: 56)
            .padding([.leading, .trailing], 12)
            .background(Color.clear)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        viewModel.usernameError != nil ? Color.appPrimary : Color.appElevation2,
                        lineWidth: 2
                    )
            )

            if let usernameError = viewModel.usernameError {
                Text(usernameError)
                    .font(.font(.nunitoSemiBold, size: .medium))
                    .foregroundColor(.appPrimary)
                    .lineLimit(1)
            }
        }
    }

    // MARK: - Password Field View
    private var passwordFieldView: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image("ic_password", bundle: .assetsKit)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.appText)

                SecureField("Şifre", text: $viewModel.password)
                    .textContentType(.newPassword)
                    .onChange(of: viewModel.password) { _ in
                        viewModel.validatePassword()
                    }
                    .foregroundColor(.appText)
                    .font(.font(.nunitoSemiBold, size: .xxLarge))
            }
            .frame(height: 56)
            .padding([.leading, .trailing], 12)
            .background(Color.clear)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        viewModel.passwordError != nil ? Color.appPrimary : Color.appElevation2,
                        lineWidth: 2
                    )
            )

            if let passwordError = viewModel.passwordError {
                Text(passwordError)
                    .font(.font(.nunitoSemiBold, size: .medium))
                    .foregroundColor(.appPrimary)
                    .lineLimit(1)
            }
        }
    }

    // MARK: - Register Button
    private var registerButton: some View {
        Button(action: {
            viewModel.register()
        }) {
            Text(L10n.Register.title)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
        }
        .buttonStyle(PrimaryLargeButton())
        .disabled(viewModel.showLoading || viewModel.email.isEmpty || viewModel.username.isEmpty || viewModel.password.isEmpty)
    }

    // MARK: - Bottom Sign In Section
    private var bottomSignInSection: some View {
        HStack(spacing: 4) {
            Text(L10n.Register.bottomText)
                .font(.font(.nunitoSemiBold, size: .small))
                .foregroundColor(.appText)

            Button(action: {
                router.navigateBack()
            }) {
                Text(L10n.Login.title)
                    .font(.font(.nunitoBold, size: .small))
                    .foregroundColor(.appPrimary)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    let viewModel = RegisterSceneModel()
    return RegisterScene(viewModel: viewModel)
}

