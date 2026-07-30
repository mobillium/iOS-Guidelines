//
//  AppLanguage.swift
//  LocalizationKit
//

import Foundation

/// Uygulamada desteklenen bir dil.
///
/// Diller **sabit kodlanmaz**: `allCases`, bundle içindeki `<lang>.lproj`
/// klasörlerini tarayarak otomatik türetilir. Yeni bir dil eklemek için
/// sadece ilgili `<lang>.lproj` klasörünü eklemek yeterlidir.
public struct AppLanguage: Identifiable, Hashable, Sendable {

    /// ISO dil kodu (klasör adı, ör. "en", "tr", "ja").
    public let code: String

    public var id: String { code }

    public init(code: String) {
        self.code = code
    }

    /// Dilin kendi dilindeki adı (ör. en→English, tr→Türkçe, ja→日本語, fr→Français).
    public var displayName: String {
        let name = Locale(identifier: code).localizedString(forLanguageCode: code) ?? code
        return name.prefix(1).uppercased() + name.dropFirst()
    }

    /// Bundle içindeki tüm `<lang>.lproj` klasörlerinden otomatik türetilen diller.
    public static var allCases: [AppLanguage] {
        let urls = Bundle.module.urls(forResourcesWithExtension: "lproj", subdirectory: nil) ?? []
        let codes = urls
            .map { $0.deletingPathExtension().lastPathComponent }
            .filter { $0.caseInsensitiveCompare("Base") != .orderedSame }
        return Array(Set(codes))
            .map { AppLanguage(code: $0) }
            .sorted { $0.displayName.localizedCaseInsensitiveCompare($1.displayName) == .orderedAscending }
    }

    /// Verilen kod mevcut dillerden biriyse ilgili `AppLanguage`'ı döner.
    public static func available(code: String) -> AppLanguage? {
        allCases.first { $0.code.caseInsensitiveCompare(code) == .orderedSame }
    }

    /// Sistem tercihlerine göre en uygun mevcut dil (yoksa İngilizce / ilk dil).
    public static var systemPreferred: AppLanguage {
        let available = allCases
        for identifier in Locale.preferredLanguages {
            let code = String(identifier.prefix(2)).lowercased()
            if let match = available.first(where: { $0.code == code }) {
                return match
            }
        }
        return available.first(where: { $0.code == "en" }) ?? available.first ?? AppLanguage(code: "en")
    }
}
