// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum Componenets {
    public enum Action {
      /// Components.strings
      ///  SampleProject
      ///  
      ///  Created by Mehmet Salih Aslan on 26.02.2021.
      ///  Copyright © 2021 SampleProject. All rights reserved.
      public static let block = L10n.tr("Componenets", "Action.block", fallback: "Block")
      /// Giriş yapmanız gereklidir.
      public static let loginWarning = L10n.tr("Componenets", "Action.loginWarning", fallback: "Giriş yapmanız gereklidir.")
    }
    public enum Comment {
      /// Bir şeyler yazın..
      public static let placeholder = L10n.tr("Componenets", "Comment.placeholder", fallback: "Bir şeyler yazın..")
    }
  }
  public enum Error {
    /// Lütfen bilgilerinizi kontrol ediniz.
    public static let checkInformations = L10n.tr("Error", "checkInformations", fallback: "Lütfen bilgilerinizi kontrol ediniz.")
    /// Error.strings
    ///  SampleProject
    ///  
    ///  Created by Mehmet Salih Aslan on 26.02.2021.
    ///  Copyright © 2021 SampleProject. All rights reserved.
    public static func empty(_ p1: Any) -> String {
      return L10n.tr("Error", "empty", String(describing: p1), fallback: "%@ alanı boş olamaz.")
    }
    /// Lütfen boş alanları doldurunuz.
    public static let emptyFields = L10n.tr("Error", "emptyFields", fallback: "Lütfen boş alanları doldurunuz.")
    /// Lütfen ekranı yukarıdan aşağıya kaydırarak yenileyiniz.
    public static let refreshFromTop = L10n.tr("Error", "refreshFromTop", fallback: "Lütfen ekranı yukarıdan aşağıya kaydırarak yenileyiniz.")
    public enum Key {
      /// Yorum
      public static let comment = L10n.tr("Error", "Key.comment", fallback: "Yorum")
      /// E-posta
      public static let email = L10n.tr("Error", "Key.email", fallback: "E-posta")
      /// Username
      public static let username = L10n.tr("Error", "Key.username", fallback: "Username")
    }
  }
  public enum General {
    /// Yorum Ekle
    public static let addComment = L10n.tr("General", "addComment", fallback: "Yorum Ekle")
    /// Yorum
    public static let comment = L10n.tr("General", "comment", fallback: "Yorum")
    /// Yorumlar
    public static let comments = L10n.tr("General", "comments", fallback: "Yorumlar")
    /// Takip Et
    public static let follow = L10n.tr("General", "follow", fallback: "Takip Et")
    /// Takipçi
    public static let follower = L10n.tr("General", "follower", fallback: "Takipçi")
    /// Takip Ediliyor
    public static let following = L10n.tr("General", "following", fallback: "Takip Ediliyor")
    /// Vazgeç
    public static let giveUp = L10n.tr("General", "giveUp", fallback: "Vazgeç")
    /// Beğeni
    public static let like = L10n.tr("General", "like", fallback: "Beğeni")
    /// Giriş Yap
    public static let login = L10n.tr("General", "login", fallback: "Giriş Yap")
    /// Tarif
    public static let recipe = L10n.tr("General", "recipe", fallback: "Tarif")
    /// Malzemeler
    public static let recipeIngredients = L10n.tr("General", "recipeIngredients", fallback: "Malzemeler")
    /// Yapılışı
    public static let recipeSteps = L10n.tr("General", "recipeSteps", fallback: "Yapılışı")
    /// Üye Ol
    public static let register = L10n.tr("General", "register", fallback: "Üye Ol")
  }
  public enum Modules {
    public enum CommentEditController {
      /// Kaydet
      public static let save = L10n.tr("Modules", "CommentEditController.save", fallback: "Kaydet")
      /// YORUM DÜZENLE
      public static let title = L10n.tr("Modules", "CommentEditController.title", fallback: "YORUM DÜZENLE")
    }
    public enum CommentListController {
      /// YORUMLAR
      public static let title = L10n.tr("Modules", "CommentListController.title", fallback: "YORUMLAR")
    }
    public enum Favorites {
      /// TÜMÜNÜ GÖR
      public static let seeAllButtonTitle = L10n.tr("Modules", "Favorites.seeAllButtonTitle", fallback: "TÜMÜNÜ GÖR")
    }
    public enum Home {
      /// EDİTÖR SEÇİMİ
      public static let editorChoiceRecipes = L10n.tr("Modules", "Home.editorChoiceRecipes", fallback: "EDİTÖR SEÇİMİ")
      /// SON EKLENENLER
      public static let lastAddedRecipes = L10n.tr("Modules", "Home.lastAddedRecipes", fallback: "SON EKLENENLER")
      /// %@ Yorum %@ Beğeni
      public static func recipeCommnetAndLikeCount(_ p1: Any, _ p2: Any) -> String {
        return L10n.tr("Modules", "Home.recipeCommnetAndLikeCount", String(describing: p1), String(describing: p2), fallback: "%@ Yorum %@ Beğeni")
      }
      /// %@ Tarif %@ Takipçi
      public static func userRecipeAndFollowerCount(_ p1: Any, _ p2: Any) -> String {
        return L10n.tr("Modules", "Home.userRecipeAndFollowerCount", String(describing: p1), String(describing: p2), fallback: "%@ Tarif %@ Takipçi")
      }
    }
    public enum LoginViewController {
      /// Hesabın mı yok?
      public static let bottomText = L10n.tr("Modules", "LoginViewController.bottomText", fallback: "Hesabın mı yok?")
      /// Şifrenizi mi unuttunuz?
      public static let forgotPassword = L10n.tr("Modules", "LoginViewController.forgotPassword", fallback: "Şifrenizi mi unuttunuz?")
      /// Giriş Yap
      public static let title = L10n.tr("Modules", "LoginViewController.title", fallback: "Giriş Yap")
    }
    public enum PasswordResetController {
      /// Sıfırla
      public static let reset = L10n.tr("Modules", "PasswordResetController.reset", fallback: "Sıfırla")
      /// Şifre Sıfırlama
      public static let title = L10n.tr("Modules", "PasswordResetController.title", fallback: "Şifre Sıfırlama")
    }
    public enum RecipeDetail {
      /// Henüz yorum yapılmamıştır.
      public static let noComment = L10n.tr("Modules", "RecipeDetail.noComment", fallback: "Henüz yorum yapılmamıştır.")
    }
    public enum RegisterViewController {
      /// Hesabın mı var?
      public static let bottomText = L10n.tr("Modules", "RegisterViewController.bottomText", fallback: "Hesabın mı var?")
      /// Üye Ol
      public static let title = L10n.tr("Modules", "RegisterViewController.title", fallback: "Üye Ol")
    }
    public enum SignIn {
      /// Modules.strings
      ///  SampleProject
      ///  
      ///  Created by Mehmet Salih Aslan on 26.02.2021.
      ///  Copyright © 2021 SampleProject. All rights reserved.
      public static let navigationTitle = L10n.tr("Modules", "SignIn.navigationTitle", fallback: "Sign In")
    }
    public enum WalkThrough {
      /// Fodamy is the best place to find your favorite recipes in all around the world.
      public static let descriptionText = L10n.tr("Modules", "WalkThrough.descriptionText", fallback: "Fodamy is the best place to find your favorite recipes in all around the world.")
      /// Welcome to Fodamy Network!
      public static let firstTitle = L10n.tr("Modules", "WalkThrough.firstTitle", fallback: "Welcome to Fodamy Network!")
      /// Share recipes with others.
      public static let fourthTitle = L10n.tr("Modules", "WalkThrough.fourthTitle", fallback: "Share recipes with others.")
      /// İlerle
      public static let next = L10n.tr("Modules", "WalkThrough.Next", fallback: "İlerle")
      /// Finding recipes were not that easy.
      public static let secondTitle = L10n.tr("Modules", "WalkThrough.secondTitle", fallback: "Finding recipes were not that easy.")
      /// Başla!
      public static let start = L10n.tr("Modules", "WalkThrough.Start", fallback: "Başla!")
      /// Add new recipe.
      public static let thirdTitle = L10n.tr("Modules", "WalkThrough.thirdTitle", fallback: "Add new recipe.")
    }
  }
  public enum Placeholder {
    /// E-mail Adresi
    public static let email = L10n.tr("Placeholder", "email", fallback: "E-mail Adresi")
    /// Şifre
    public static let password = L10n.tr("Placeholder", "password", fallback: "Şifre")
    /// Placeholder.strings
    ///  SampleProject
    ///  
    ///  Created by Mehmet Salih Aslan on 26.02.2021.
    ///  Copyright © 2021 SampleProject. All rights reserved.
    public static let username = L10n.tr("Placeholder", "username", fallback: "Kullanıcı Adı")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
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
