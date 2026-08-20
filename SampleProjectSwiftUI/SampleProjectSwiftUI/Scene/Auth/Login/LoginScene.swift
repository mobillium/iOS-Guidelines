//
//  LoginScene.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 9.04.2026.
//

import Combine
import SwiftUI
import AssetsKit
import Components
import Router
import LocalizationKit

struct LoginScene<ViewModel: LoginSceneModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    @EnvironmentObject private var router: Router
    
    var body: some View {
        BaseScene(content: {
            VStack(spacing: .zero) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: .zero) {
                        usernameFieldView
                        
                        Spacer(minLength: 20)
                        
                        passwordFieldView
                        
                        Spacer(minLength: 32)
                        
                        loginButton
                        
                        Spacer(minLength: 12)
                        
                        forgotPasswordButton
                    }
                    .padding([.top, .leading, .trailing], 16)
                }
                Spacer()
                
                bottomSignUpSection
            }
        }, viewModel: viewModel)
        .navigationTitle(L10n.Login.title)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.appElevation1)
        .toolbarBackground(Color.appPrimary, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if #available(iOS 26.0, *) {
                    Button(action: {
                        NotificationCenter.default.post(name: .dismissAuth, object: nil)
                    }) {
                        Image(systemName: "xmark")
                            .font(.font(.nunitoBold, size: .medium))
                            .foregroundColor(.appPureWhite)
                    }
                    .buttonStyle(GlassProminentButtonStyle())
                    .tint(.appPrimary)
                } else {
                    Button(action: {
                        NotificationCenter.default.post(name: .dismissAuth, object: nil)
                    }) {
                        Image(systemName: "xmark")
                            .font(.font(.nunitoBold, size: .medium))
                            .foregroundColor(.appPureWhite)
                    }
                }
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
                    .onChange(of: viewModel.username) {
                        viewModel.validateUsername()
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
                    .textContentType(.password)
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
    
    // MARK: - Forgot Password Button
    private var forgotPasswordButton: some View {
        HStack {
            Spacer()
            Button(action: {
                router.navigate(to: AuthDestinations.forgotPassword)
            }) {
                Text(L10n.Login.forgotPassword)
                    .font(.font(.nunitoSemiBold, size: .small))
                    .foregroundColor(.appPrimary)
            }
        }
    }
    
    // MARK: - Login Button
    private var loginButton: some View {
        Button(action: {
            viewModel.login()
        }) {
            Text(L10n.Login.title)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
        }
        .buttonStyle(PrimaryLargeButton())
        .disabled(viewModel.showLoading || viewModel.username.isEmpty || viewModel.password.isEmpty)
    }
    
    // MARK: - Bottom Sign Up Section
    private var bottomSignUpSection: some View {
        HStack(spacing: 4) {
            Text(L10n.Login.bottomText)
                .font(.font(.nunitoSemiBold, size: .small))
                .foregroundColor(.appText)
            
            NavigationLink(value: AuthDestinations.register) {
                Text("Üye Ol")
                    .font(.font(.nunitoBold, size: .small))
                    .foregroundColor(.appPrimary)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    let viewModel = LoginSceneModel()
    return LoginScene(viewModel: viewModel)
}
