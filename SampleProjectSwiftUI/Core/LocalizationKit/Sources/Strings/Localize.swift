//
//  Localize.swift
//  LocalizationKit
//
//  Created by Mehmet Salih Aslan on 5.02.2026.
//

import Foundation

// "unchecked Sendable" diyerek kontrolü devralıyoruz
public final class Localize: @unchecked Sendable {

    public static let shared = Localize()
    
    // Okuma/Yazma sırasında çakışmayı önleyecek kilit
    private let lock = NSLock()
    
    // Gerçek veriyi private tutuyoruz
    private var _strings: [String: String] = [:]

    // Dışarıya güvenli bir erişim açıyoruz
    public var strings: [String: String] {
        get {
            lock.lock()
            defer { lock.unlock() }
            return _strings
        }
        set {
            lock.lock()
            defer { lock.unlock() }
            _strings = newValue
        }
    }

    private init() {}
}
