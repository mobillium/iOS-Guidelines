//
//  TokenStorage.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 9.04.2026.
//

import Foundation
import KeychainSwift

public enum TokenStorage {

    private static let keychain = KeychainSwift()
    private static let tokenKey = "X-Fodamy-Token"

    public static func save(token: String) {
        keychain.set(token, forKey: tokenKey)
    }

    public static var token: String? {
        keychain.get(tokenKey)
    }

    public static func delete() {
        keychain.delete(tokenKey)
    }

    public static var isLoggedIn: Bool {
        token != nil
    }
}
