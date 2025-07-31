//
//  AuthRepository.swift
//
//
//  Created by Mehmet Salih Aslan on 2.02.2024.
//

import Foundation
import Network
import Domain

public final class AuthRepository: BaseRepository, AuthRepositoryProtocol {
    
    public func forgotPassword(email: String) async -> NetworkResult<Auth> {
        let request = ForgotPasswordRequest(email: email)
        return await networkResponse(request: request, mapper: AuthResponseMapper())
    }
    
    public func login(username: String, password: String) async -> NetworkResult<Auth> {
        let request = LoginRequest(username: username, password: password)
        return await networkResponse(request: request, mapper: AuthResponseMapper())
    }
    
    public func logout() async -> NetworkResult<SuccessModel> {
        let request = LogoutRequest()
        return await networkResponse(request: request, mapper: SuccessResponseMapper())
    }
    
    public func register(username: String, email: String, password: String) async -> NetworkResult<Auth> {
        let request = RegisterRequest(username: username, email: email, password: password)
        return await networkResponse(request: request, mapper: AuthResponseMapper())
    }
}
