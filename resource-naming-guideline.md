# iOS Resources Style Guide

### Table of Contents

1. [Strings](#colors)
2. [Fonts](#fonts)
3. [Colors](#colors)
4. [Images](https://bitbucket.org/mobillium/development-guides/wiki/iOS#images)
5. [Custom Views and Cells](https://bitbucket.org/mobillium/development-guides/wiki/iOS#custom-views)

<a name="strings"></a>

# :capital_abcd: Strings

---

* Creating string key: **where\_screen\_description\_type**
* Using in Swift: **Localization.Where.descriptionType**

```swift
// example
// Localization.string
"Trade.AmountTitle" = "trade_screen_amount_title"

// using in Swift
let amountTitle = Localization.Trade.AmountTitle
```

<a name="fonts"></a>

# :pencil: Fonts

---

```swift
import UIKit

extension UIFont {

    enum FontWeight: String {
        case semibold     = "Inter-Semibold"
        case regular      = "Inter-Regular"
        case medium       = "Inter-Medium"
        case monoLight    = "IBMPlexMono-Light"
        case monoRegular  = "IBMPlexMono"
    }

    enum FontSize: CGFloat {
        ///40
        case large      = 40
        ///27
        case h1         = 27
        ///21
        case h2         = 21
        ///17
        case h3         = 17
    }
    static func font(_ weight: UIFont.FontWeight, size: FontSize) -> UIFont {
        return UIFont(name: weight.rawValue, size: size.rawValue)!
    }
}
```

<a name="colors"></a>

#Colors

---

> :warning: Don't use the Assets.xcassets Create Colors.xcassets

* Creating Color: **textPrimary = 11111** in **Colors.xcassets**
* Create color in **Colors.xcassets** for directly using to iOS 11 and newer

<a name="images"></a>

# :camera_with_flash: Images and Icons

---

> :warning: Don't use the Assets.xcassets Create Images.xcassets

* Add new asset

    * new icon: **ic\_where\_description**
    * new image: **img\_where\_description**
    
* Create struct in Assets struct

    * `struct Icon`
    * `struct Image`
    
* Using

    * `Asset.Icon.WhereDescription`
    * `Asset.Image.WhereDescription`
    

```swift
// example
// Icon -> "ic_navbar_notification"
// Image -> "img_tutorial_first"
struct Asset {
    struct Image {
        static var NavbarNotification: UIImage {
            return UIImage(named: "ic_navbar_notification")
        }
    }
}
let navbarNotifyIcon = Asset.Image.NavbarNotification
```

<a name="custom-views"></a>

# :file_folder: Custom Views and Cells

> Create a subfolder with their parent class name folder inside CustomView like UIView, UIButton, etc. And create your custom view class inside the subfolder
‌

```text
├── Custom Views
│   ├── UIView
│   │   ├── BaseView
│   │   ├── CorneredView
│   ├── UIButton
│   │   ├── AppButton
│   │   ├── CorneredButton
```
> use as in Custom Views and just change the parent folder name as Cell instead of Custom Views

```text
├── Cell
│   ├── DieticianVC
│   │   ├── DieticianCell
│   ├── GalleryVC
│   │   ├── DieticianGalleryCell
│   │   ├── ClinicGalleryCell
```
