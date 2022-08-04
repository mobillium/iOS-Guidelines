// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localizable {
  internal enum Favorites {
    /// %d Yorum %d Beğeni
    internal static func recipeStats(_ p1: Int, _ p2: Int) -> String {
      return Localizable.tr("Favorites", "recipeStats", p1, p2)
    }
    /// TÜMÜNÜ GÖR
    internal static let seeAllButtonTitle = Localizable.tr("Favorites", "seeAllButtonTitle")
    /// %d Tarif %d Takipçi
    internal static func userStats(_ p1: Int, _ p2: Int) -> String {
      return Localizable.tr("Favorites", "userStats", p1, p2)
    }
  }
  internal enum Recipes {
    /// %d Yorum %d Beğeni
    internal static func recipeStats(_ p1: Int, _ p2: Int) -> String {
      return Localizable.tr("Recipes", "recipeStats", p1, p2)
    }
    /// %d Tarif %d Takipçi
    internal static func userStats(_ p1: Int, _ p2: Int) -> String {
      return Localizable.tr("Recipes", "userStats", p1, p2)
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localizable {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
