//
//  Untitled.swift
//  SampleProjectSwiftUI
//
//  Created by Ahmet İmirze on 20.08.2026.
//

import SwiftUI
import AssetsKit
import Components
import LocalizationKit
import Router

struct ForgotPasswordScene<ViewModel: ForgotPasswordSceneModel>: View {

    @ObservedObject var viewModel: ViewModel
	@EnvironmentObject private var router: Router
	@Environment(\.presentToast) private var presentToast

	var body: some View {
		BaseScene(content: {
			VStack(spacing: .zero) {
				ScrollView(.vertical, showsIndicators: false) {
					VStack(spacing: .zero) {
						emailFieldView

						Spacer(minLength: 32)

						continueButton
					}
					.padding([.top, .leading, .trailing], 16)
				}

				Spacer()
			}
		}, viewModel: viewModel)
		.navigationTitle(L10n.ResetPassword.title)
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

	private var continueButton: some View {
		Button(action: {
			guard viewModel.validateEmail() else { return }

			presentToast(
				ToastValue(
					icon: Image(systemName: "checkmark.circle.fill"),
					message: "Şifre yenileme bağlantısı gönderildi."
				)
			)

			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				router.navigateBack()
			}
		}) {
			Text("Devam")
				.frame(maxWidth: .infinity)
				.frame(height: 56)
		}
		.buttonStyle(PrimaryLargeButton())
	}
}

#Preview {
	ForgotPasswordScene(viewModel: ForgotPasswordSceneModel())
}

