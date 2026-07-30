//
//  LanguageManager.swift
//  LocalizationKit
//

import Combine
import Foundation

/// Uygulama dilini yöneten merkezi sınıf.
///
/// Seçili dilin tüm `.strings` tablolarını okuyup `Localize.shared.strings`
/// sözlüğüne yazar; `L10n.tr` her çağrıda bu sözlüğü kontrol ettiği için
/// diller çalışma zamanında anında değişir.
@MainActor
public final class LanguageManager: ObservableObject {

    public static let shared = LanguageManager()

    private static let selectionKey = "selectedLanguageCode"

    /// Aktif dil. Değiştiğinde gözlemleyen görünümler yeniden kurulur.
    @Published public private(set) var current: AppLanguage

    /// Kullanıcı henüz bir dil seçmediyse `true` (sistem dili kullanılıyor).
    public private(set) var isUsingSystemDefault: Bool

    private let defaults: UserDefaults

    private init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        if let code = defaults.string(forKey: Self.selectionKey),
           let saved = AppLanguage.available(code: code) {
            self.current = saved
            self.isUsingSystemDefault = false
        } else {
            self.current = AppLanguage.systemPreferred
            self.isUsingSystemDefault = true
        }
    }

    /// Uygulama açılışında çağrılır; seçili dili yükler.
    public func configureOnLaunch() {
        applyStrings(for: current)
    }

    /// Dili değiştirir, kalıcı olarak saklar ve stringleri yeniden yükler.
    public func setLanguage(_ language: AppLanguage) {
        guard language != current else { return }
        defaults.set(language.code, forKey: Self.selectionKey)
        isUsingSystemDefault = false
        applyStrings(for: language)
        current = language
    }

    // MARK: - Private

    /// Verilen dilin tüm `.strings` tablolarını `Localize.shared.strings`'e yükler.
    private func applyStrings(for language: AppLanguage) {
        guard
            let lprojURL = Bundle.module.url(forResource: language.code, withExtension: "lproj"),
            let files = try? FileManager.default.contentsOfDirectory(
                at: lprojURL,
                includingPropertiesForKeys: nil
            )
        else {
            return
        }

        var merged: [String: String] = [:]
        for file in files where file.pathExtension == "strings" {
            if let table = NSDictionary(contentsOf: file) as? [String: String] {
                merged.merge(table) { _, new in new }
            }
        }
        Localize.shared.strings = merged
    }
}
