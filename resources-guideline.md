# iOS Resources Guideline

### Table of Contents

1. [Strings](#strings)
2. [Fonts](#fonts)
3. [Colors, Images and Icons](#assets)

# Resources

Folder containing files added externally to the project. Examples of these are Gif's, Animations, Assets, Sound Files, Strings, Font files.(Externally added .plist files are not included in this category.)

```text
├── UIComponents

  ├── Resources
    ├── Assets
      ├── Icons.xcassets
      ├── Images.xcassets
      ├── Colors.xcassets
      ├── Assets.swift
      ├── UIImage+Icons.swift
      ├── UIImage+Images.swift
      ├── UIColor+Colors.swift
    ├── Strings
      ├── General.strings
      ├── Error.strings
      ├── Placeholder.strings
      ├── Modules.strings
      ├── Components.strings
      ├── StringConstants.strings
    ├── Fonts
      ├── Fonts.swift
      ├── UIFont+Extensions.swift
      ├── Fonts files
    ├── Sounds
      ├── Sound files
    ├── Gif
      ├── Gif files
```

# Installations

  1. Create **Assets**, **Strings** and **Fonts** files as above structure.
  2. Install [SwiftGen](https://github.com/SwiftGen/SwiftGen) via CocoaPods to UIComponents module.
  3. Add **swiftgen.yml** file to UIComponents module.
  4. Add custom stencil files to under Project folder. Custom stencil files located inside of SampleProject.


<a name="strings"></a>

# Strings

---

* SwiftGen automatically generate strings constants.
* Using in Swift: **l10n.Where.descriptionType**

```swift
// example
// General.string
"cancel" = "Cancel"

// using in Swift
let cancel = l10n.General.cancel
```

<a name="fonts"></a>

# Fonts

---

* SwiftGen automatically generate fonts constants.

```swift
//  UIFont+Extensions.swift

import UIKit

extension UIFont {

  enum FontWeight {
      case interRegular
      case interLight
      case interMedium
      case interSemiBold
      case interBold
  }

  // swiftlint:disable identifier_name
  enum FontSize {
      /// 13
      case small

      /// 40
      case large

      /// 27
      case h1

      /// 21
      case h2

      /// 17
      case h3

      /// custom
      case custom(size: CGFloat)

      public var rawValue: CGFloat {
          switch self {
          case .small: return 13
          case .large:  return 40
          case .h1: return 27
          case .h2: return 21
          case .h3: return 17
          case .custom(let size):return size
          }
      }
  }
  // swiftlint:enable identifier_name

  static func font(_ weight: UIFont.FontWeight, size: FontSize) -> UIFont {
      let font: UIFont
      switch weight {
      case .interRegular:
          font = FontFamily.Inter.regular.font(size: size.rawValue)
      case .interLight:
          font = FontFamily.Inter.light.font(size: size.rawValue)
      case .interMedium:
          font = FontFamily.Inter.medium.font(size: size.rawValue)
      case .interSemiBold:
          font = FontFamily.Inter.semiBold.font(size: size.rawValue)
      case .interBold:
          font = FontFamily.Inter.bold.font(size: size.rawValue)
      }
      return font
  }
}
```

<a name="assets"></a>

# Colors, Images and Icons

---

> :warning: Don't use the Assets.xcassets. Create Colors.xcassets for colors,  create Images.xcassets for multiple colors images and create Icons.xcassets for single color images. Colors should be stored under the Colors.xcassets. Single color images should be stored under the Icons.xcassets. Multiple colors images should be stored under the Images.xcassets. All icons and images files should be used .pdf type(preverse vector data and single scale should be selected on Attributes inspector) except app icon and launch screen assets should be used .png type.˜

* SwiftGen automatically generate assets constants.

* Add new asset

  * Creating color: **textPrimary = 11111** in **Colors.xcassets**
  * new icon: **ic\_name\_subname** in **Icons.xcassets**, naming should be named snake case.
  * new image: **img\_name\_subname** in **Images.xcassets**, naming should be named snake case.

* Using

    * `color = .textPrimary`
    * `image = .imgNameSubname`
    * `image = .icNameSubname`
