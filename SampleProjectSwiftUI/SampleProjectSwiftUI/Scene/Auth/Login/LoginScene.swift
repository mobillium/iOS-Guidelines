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
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        BaseScene(content: {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 24) {
                    headerView
                    
                    Spacer(minLength: 40)
                    
                    emailFieldView
                    passwordFieldView
                    
                    forgotPasswordButton
                    
                    Spacer(minLength: 24)
                    
                    loginButton
                    
                    Spacer(minLength: 40)
                    
                    bottomSignUpSection
                    
                    Spacer()
                }
                .padding([.leading, .trailing], 16)
                .padding(.top, 16)
            }
        }, viewModel: viewModel)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.appElevation1)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.appPrimary)
                }
            }
        }
    }
    
    // MARK: - Header View
    private var headerView: some View {
        Text(L10n.Login.title)
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
                
                TextField("E-mail Adresi", text: $viewModel.email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .onChange(of: viewModel.email) { _ in
                        viewModel.validateEmail()
                    }
                    .foregroundColor(.appText)
                    .font(.font(.nunitoSemiBold, size: .large))
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
                    .font(.font(.nunitoSemiBold, size: .large))
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
                // TODO: Navigate to forgot password screen
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
        .disabled(viewModel.showLoading || viewModel.email.isEmpty || viewModel.password.isEmpty)
    }
    
    // MARK: - Bottom Sign Up Section
    private var bottomSignUpSection: some View {
        HStack(spacing: 4) {
            Text(L10n.Login.bottomText)
                .font(.font(.nunitoSemiBold, size: .small))
                .foregroundColor(.appText)
            
            Button(action: {
                // TODO: Navigate to registration screen
            }) {
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
