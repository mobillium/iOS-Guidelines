// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// MARK: - Strings

public enum L10n {
    public enum Login {
      /// Hesabın mı yok?
      public static var bottomText: String { return L10n.tr("Auth", "Login.bottomText") }
      /// Şifrenizi mi unuttunuz?
      public static var forgotPassword: String { return L10n.tr("Auth", "Login.forgotPassword") }
      /// Giriş Yap
      public static var title: String { return L10n.tr("Auth", "Login.title") }
    }
    public enum Register {
      /// Hesabın mı var?
      public static var bottomText: String { return L10n.tr("Auth", "Register.bottomText") }
      /// Üye Ol
      public static var title: String { return L10n.tr("Auth", "Register.title") }
    }
    public enum SignIn {
      /// Sign In
      public static var navigationTitle: String { return L10n.tr("Auth", "SignIn.navigationTitle") }
    }
    public enum Action {
      /// Block
      public static var block: String { return L10n.tr("Componenets", "Action.block") }
      /// Giriş yapmanız gereklidir.
      public static var loginWarning: String { return L10n.tr("Componenets", "Action.loginWarning") }
    }
    public enum Comment {
      /// Bir şeyler yazın..
      public static var placeholder: String { return L10n.tr("Componenets", "Comment.placeholder") }
    }
    public enum Error {
      /// Lütfen bilgilerinizi kontrol ediniz.
      public static var checkInformations: String { return L10n.tr("Error", "Error.checkInformations") }
      /// %@ alanı boş olamaz.
      public static func empty(_ p1: Any) -> String {
        return L10n.tr("Error", "Error.empty", String(describing: p1))
      }
      /// Lütfen boş alanları doldurunuz.
      public static var emptyFields: String { return L10n.tr("Error", "Error.emptyFields") }
      /// Lütfen ekranı yukarıdan aşağıya kaydırarak yenileyiniz.
      public static var refreshFromTop: String { return L10n.tr("Error", "Error.refreshFromTop") }
      public enum Key {
        /// Yorum
        public static var comment: String { return L10n.tr("Error", "Error.Key.comment") }
        /// E-posta
        public static var email: String { return L10n.tr("Error", "Error.Key.email") }
        /// Username
        public static var username: String { return L10n.tr("Error", "Error.Key.username") }
      }
    }
    public enum General {
      /// Yorum Ekle
      public static var addComment: String { return L10n.tr("General", "General.addComment") }
      /// Yorum
      public static var comment: String { return L10n.tr("General", "General.comment") }
      /// Yorumlar
      public static var comments: String { return L10n.tr("General", "General.comments") }
      /// Takip Et
      public static var follow: String { return L10n.tr("General", "General.follow") }
      /// Takipçi
      public static var follower: String { return L10n.tr("General", "General.follower") }
      /// Takip Ediliyor
      public static var following: String { return L10n.tr("General", "General.following") }
      /// Vazgeç
      public static var giveUp: String { return L10n.tr("General", "General.giveUp") }
      /// Beğeni
      public static var like: String { return L10n.tr("General", "General.like") }
      /// Giriş Yap
      public static var login: String { return L10n.tr("General", "General.login") }
      /// Tarif
      public static var recipe: String { return L10n.tr("General", "General.recipe") }
      /// Malzemeler
      public static var recipeIngredients: String { return L10n.tr("General", "General.recipeIngredients") }
      /// Yapılışı
      public static var recipeSteps: String { return L10n.tr("General", "General.recipeSteps") }
      /// Üye Ol
      public static var register: String { return L10n.tr("General", "General.register") }
    }
    public enum CommentEdit {
      /// Kaydet
      public static var save: String { return L10n.tr("Modules", "CommentEdit.save") }
      /// YORUM DÜZENLE
      public static var title: String { return L10n.tr("Modules", "CommentEdit.title") }
    }
    public enum CommentList {
      /// YORUMLAR
      public static var title: String { return L10n.tr("Modules", "CommentList.title") }
    }
    public enum Favorites {
      /// TÜMÜNÜ GÖR
      public static var seeAllButtonTitle: String { return L10n.tr("Modules", "Favorites.seeAllButtonTitle") }
    }
    public enum Home {
      /// EDİTÖR SEÇİMİ
      public static var editorChoiceRecipes: String { return L10n.tr("Modules", "Home.editorChoiceRecipes") }
      /// SON EKLENENLER
      public static var lastAddedRecipes: String { return L10n.tr("Modules", "Home.lastAddedRecipes") }
      /// %@ Yorum %@ Beğeni
      public static func recipeCommnetAndLikeCount(_ p1: Any, _ p2: Any) -> String {
        return L10n.tr("Modules", "Home.recipeCommnetAndLikeCount", String(describing: p1), String(describing: p2))
      }
      /// %@ Tarif %@ Takipçi
      public static func userRecipeAndFollowerCount(_ p1: Any, _ p2: Any) -> String {
        return L10n.tr("Modules", "Home.userRecipeAndFollowerCount", String(describing: p1), String(describing: p2))
      }
    }
    public enum RecipeDetail {
      /// Henüz yorum yapılmamıştır.
      public static var noComment: String { return L10n.tr("Modules", "RecipeDetail.noComment") }
    }
    public enum ResetPassword {
      /// Sıfırla
      public static var reset: String { return L10n.tr("Modules", "ResetPassword.reset") }
      /// Şifre Sıfırlama
      public static var title: String { return L10n.tr("Modules", "ResetPassword.title") }
    }
    public enum WalkThrough {
      /// Fodamy is the best place to find your favorite recipes in all around the world.
      public static var descriptionText: String { return L10n.tr("Modules", "WalkThrough.descriptionText") }
      /// Welcome to Fodamy Network!
      public static var firstTitle: String { return L10n.tr("Modules", "WalkThrough.firstTitle") }
      /// Share recipes with others.
      public static var fourthTitle: String { return L10n.tr("Modules", "WalkThrough.fourthTitle") }
      /// İlerle
      public static var next: String { return L10n.tr("Modules", "WalkThrough.Next") }
      /// Finding recipes were not that easy.
      public static var secondTitle: String { return L10n.tr("Modules", "WalkThrough.secondTitle") }
      /// Başla!
      public static var start: String { return L10n.tr("Modules", "WalkThrough.Start") }
      /// Add new recipe.
      public static var thirdTitle: String { return L10n.tr("Modules", "WalkThrough.thirdTitle") }
    }
    public enum Placeholder {
      /// E-mail Adresi
      public static var email: String { return L10n.tr("Placeholder", "Placeholder.email") }
      /// Şifre
      public static var password: String { return L10n.tr("Placeholder", "Placeholder.password") }
      /// Kullanıcı Adı
      public static var username: String { return L10n.tr("Placeholder", "Placeholder.username") }
    }
}

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    var format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    if let value = Localize.shared.strings[key] {
        format = value
    }
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable all
