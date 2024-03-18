//
//  AuthRepository.swift
//
//
//  Created by Mehmet Salih Aslan on 2.02.2024.
//

import Foundation
import Network

public protocol AuthRepositoryProtocol {
    func forgotPassword(email: String) async -> DecodableResult<Auth>
    func login(username: String, password: String) async -> DecodableResult<Auth>
    func logout() async -> DecodableResult<SuccessResponse>
    func register(username: String, email: String, password: String) async -> DecodableResult<Auth>
}

public final class AuthRepository: BaseRepository, AuthRepositoryProtocol {
    
    public func forgotPassword(email: String) async -> DecodableResult<Auth> {
        let request = ForgotPasswordRequest(email: email)
        return await decodableResponse(request: request)
    }
    
    public func login(username: String, password: String) async -> DecodableResult<Auth> {
        let request = LoginRequest(username: username, password: password)
        return await decodableResponse(request: request)
    }
    
    public func logout() async -> DecodableResult<SuccessResponse> {
        let request = LogoutRequest()
        return await decodableResponse(request: request)
    }
    
    public func register(username: String, email: String, password: String) async -> DecodableResult<Auth> {
        let request = RegisterRequest(username: username, email: email, password: password)
        return await decodableResponse(request: request)
    }
}
