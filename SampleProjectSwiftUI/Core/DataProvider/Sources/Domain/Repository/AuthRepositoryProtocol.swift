//
//  AuthRepositoryProtocol.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 24.07.2025.
//

import Network

public protocol AuthRepositoryProtocol {
    func forgotPassword(email: String) async -> DomainResult<Auth>
    func login(username: String, password: String) async -> DomainResult<Auth>
    func logout() async -> DomainResult<SuccessModel>
    func register(username: String, email: String, password: String) async -> DomainResult<Auth>
}
