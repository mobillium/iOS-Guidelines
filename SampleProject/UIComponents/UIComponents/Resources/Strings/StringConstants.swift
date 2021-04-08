// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum Componenets {
    public enum Action {
      /// Block
      public static let block = L10n.tr("Componenets", "Action.block")
      /// Giriş yapmanız gereklidir.
      public static let loginWarning = L10n.tr("Componenets", "Action.loginWarning")
    }
  }
  public enum Error {
    /// %@ can not be empty.
    public static func empty(_ p1: Any) -> String {
      return L10n.tr("Error", "empty", String(describing: p1))
    }
    public enum Key {
      /// Username
      public static let username = L10n.tr("Error", "Key.username")
    }
  }
  public enum General {
    /// Yorum
    public static let comment = L10n.tr("General", "comment")
    /// Takip Et
    public static let follow = L10n.tr("General", "follow")
    /// Takip Ediliyor
    public static let following = L10n.tr("General", "following")
    /// Vazgeç
    public static let giveUp = L10n.tr("General", "giveUp")
    /// Beğeni
    public static let like = L10n.tr("General", "like")
    /// Giriş Yap
    public static let login = L10n.tr("General", "login")
    /// Sign In
    public static let signIn = L10n.tr("General", "signIn")
  }
  public enum Modules {
    public enum Favorites {
      /// TÜMÜNÜ GÖR
      public static let seeAllButtonTitle = L10n.tr("Modules", "Favorites.seeAllButtonTitle")
    }
    public enum SignIn {
      /// Sign In
      public static let navigationTitle = L10n.tr("Modules", "SignIn.navigationTitle")
    }
  }
  public enum Placeholder {
    /// Username
    public static let username = L10n.tr("Placeholder", "username")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
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
