//
//  PasswordResetViewModel.swift
//  SampleProject
//
//  Created by Murat Celebi on 31.05.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

protocol PasswordResetViewDataSource {}

protocol PasswordResetViewEventSource {}

protocol PasswordResetViewProtocol: PasswordResetViewDataSource, PasswordResetViewEventSource {
    func passwordReset(email: String)
}

final class PasswordResetViewModel: BaseViewModel<PasswordResetRouter>, PasswordResetViewProtocol {
    
}

// MARK: - Network
extension PasswordResetViewModel {
    
    func passwordReset(email: String) {
        showLoading?()
        let request = ForgotPasswordRequest(email: email)
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success:
                self.router.close()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
