// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// MARK: - Strings

public enum L10n {
    public enum Login {
      /// Hesabın mı yok?
      public static let bottomText = L10n.tr("Auth", "Login.bottomText")
      /// Şifrenizi mi unuttunuz?
      public static let forgotPassword = L10n.tr("Auth", "Login.forgotPassword")
      /// Giriş Yap
      public static let title = L10n.tr("Auth", "Login.title")
    }
    public enum Register {
      /// Hesabın mı var?
      public static let bottomText = L10n.tr("Auth", "Register.bottomText")
      /// Üye Ol
      public static let title = L10n.tr("Auth", "Register.title")
    }
    public enum SignIn {
      /// Sign In
      public static let navigationTitle = L10n.tr("Auth", "SignIn.navigationTitle")
    }
    public enum Action {
      /// Block
      public static let block = L10n.tr("Componenets", "Action.block")
      /// Giriş yapmanız gereklidir.
      public static let loginWarning = L10n.tr("Componenets", "Action.loginWarning")
    }
    public enum Comment {
      /// Bir şeyler yazın..
      public static let placeholder = L10n.tr("Componenets", "Comment.placeholder")
    }
    public enum Error {
      /// Lütfen bilgilerinizi kontrol ediniz.
      public static let checkInformations = L10n.tr("Error", "Error.checkInformations")
      /// %@ alanı boş olamaz.
      public static func empty(_ p1: Any) -> String {
        return L10n.tr("Error", "Error.empty", String(describing: p1))
      }
      /// Lütfen boş alanları doldurunuz.
      public static let emptyFields = L10n.tr("Error", "Error.emptyFields")
      /// Lütfen ekranı yukarıdan aşağıya kaydırarak yenileyiniz.
      public static let refreshFromTop = L10n.tr("Error", "Error.refreshFromTop")
      public enum Key {
        /// Yorum
        public static let comment = L10n.tr("Error", "Error.Key.comment")
        /// E-posta
        public static let email = L10n.tr("Error", "Error.Key.email")
        /// Username
        public static let username = L10n.tr("Error", "Error.Key.username")
      }
    }
    public enum General {
      /// Yorum Ekle
      public static let addComment = L10n.tr("General", "General.addComment")
      /// Yorum
      public static let comment = L10n.tr("General", "General.comment")
      /// Yorumlar
      public static let comments = L10n.tr("General", "General.comments")
      /// Takip Et
      public static let follow = L10n.tr("General", "General.follow")
      /// Takipçi
      public static let follower = L10n.tr("General", "General.follower")
      /// Takip Ediliyor
      public static let following = L10n.tr("General", "General.following")
      /// Vazgeç
      public static let giveUp = L10n.tr("General", "General.giveUp")
      /// Beğeni
      public static let like = L10n.tr("General", "General.like")
      /// Giriş Yap
      public static let login = L10n.tr("General", "General.login")
      /// Tarif
      public static let recipe = L10n.tr("General", "General.recipe")
      /// Malzemeler
      public static let recipeIngredients = L10n.tr("General", "General.recipeIngredients")
      /// Yapılışı
      public static let recipeSteps = L10n.tr("General", "General.recipeSteps")
      /// Üye Ol
      public static let register = L10n.tr("General", "General.register")
    }
    public enum CommentEdit {
      /// Kaydet
      public static let save = L10n.tr("Modules", "CommentEdit.save")
      /// YORUM DÜZENLE
      public static let title = L10n.tr("Modules", "CommentEdit.title")
    }
    public enum CommentList {
      /// YORUMLAR
      public static let title = L10n.tr("Modules", "CommentList.title")
    }
    public enum Favorites {
      /// TÜMÜNÜ GÖR
      public static let seeAllButtonTitle = L10n.tr("Modules", "Favorites.seeAllButtonTitle")
    }
    public enum Home {
      /// EDİTÖR SEÇİMİ
      public static let editorChoiceRecipes = L10n.tr("Modules", "Home.editorChoiceRecipes")
      /// SON EKLENENLER
      public static let lastAddedRecipes = L10n.tr("Modules", "Home.lastAddedRecipes")
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
      public static let noComment = L10n.tr("Modules", "RecipeDetail.noComment")
    }
    public enum ResetPassword {
      /// Sıfırla
      public static let reset = L10n.tr("Modules", "ResetPassword.reset")
      /// Şifre Sıfırlama
      public static let title = L10n.tr("Modules", "ResetPassword.title")
    }
    public enum WalkThrough {
      /// Fodamy is the best place to find your favorite recipes in all around the world.
      public static let descriptionText = L10n.tr("Modules", "WalkThrough.descriptionText")
      /// Welcome to Fodamy Network!
      public static let firstTitle = L10n.tr("Modules", "WalkThrough.firstTitle")
      /// Share recipes with others.
      public static let fourthTitle = L10n.tr("Modules", "WalkThrough.fourthTitle")
      /// İlerle
      public static let next = L10n.tr("Modules", "WalkThrough.Next")
      /// Finding recipes were not that easy.
      public static let secondTitle = L10n.tr("Modules", "WalkThrough.secondTitle")
      /// Başla!
      public static let start = L10n.tr("Modules", "WalkThrough.Start")
      /// Add new recipe.
      public static let thirdTitle = L10n.tr("Modules", "WalkThrough.thirdTitle")
    }
    public enum Placeholder {
      /// E-mail Adresi
      public static let email = L10n.tr("Placeholder", "Placeholder.email")
      /// Şifre
      public static let password = L10n.tr("Placeholder", "Placeholder.password")
      /// Kullanıcı Adı
      public static let username = L10n.tr("Placeholder", "Placeholder.username")
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
