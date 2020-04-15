# Mobillium Swift Style Guide

## Naming

Variable name and function name should start with a lowercase character.
[![SwiftLint: identifier_name](https://img.shields.io/badge/SwiftLint-identifier_name-007A87.svg)](https://realm.github.io/SwiftLint/identifier_name.html)

**Preferred**:
```swift
var abc = true
func abc() {}
```
**Not Preferred**:
```swift
var Abc = true
func Abc() {}
```

Type name and protocol name should start with an uppercase character.
[![SwiftLint: type_name](https://img.shields.io/badge/SwiftLint-type_name-007A87.svg)](https://realm.github.io/SwiftLint/type_name.html)

**Preferred**:
```swift
class Abc {}
protocol Abc {}
```
**Not Preferred**:
```swift
class abc {}
protocol abc {}
```

Use compiler inferred context to write shorter, clear code.

**Preferred**:
```swift
let selector = #selector(viewDidLoad)
view.backgroundColor = .red
let toView = context.view(forKey: .to)
let view = UIView(frame: .zero)
```
**Not Preferred**:
```swift
let selector = #selector(ViewController.viewDidLoad)
view.backgroundColor = UIColor.red
let toView = context.view(forKey: UITransitionContextViewKey.to)
let view = UIView(frame: CGRect.zero)
```

 Include a hint about type in a name if it would otherwise be ambiguous.

 **Preferred**:
 ```swift
 @IBOutlet private weak var nameTextField: UITextField!
 @IBOutlet private weak var confirmButton: UITextField!
 let titleText: String
 let cancelButton: UIButton
 ```
 **Not Preferred**:
 ```swift
 @IBOutlet private weak var name: UITextField!
 @IBOutlet private weak var confirm: UITextField!
 let title: String
 let cancel: UIButton
 ```

 Name booleans like isSpaceship, hasSpacesuit, etc. This makes it clear that they are booleans and not other types.

 **Preferred**:
 ```swift
 var isPassed = true
 var hasPhoneNumber = false
 ```
 **Not Preferred**:
 ```swift
 var passed = true
 var phoneNumber = false
 ```

 Use US English spelling to match Apple's API.

 **Preferred**:
 ```swift
let color = "red"
 ```
 **Not Preferred**:
 ```swift
let colour = "red"
 ```


## Delegates

When creating custom delegate methods, an unnamed first parameter should be the delegate source. (UIKit contains numerous examples of this.

**Preferred**:
```swift
func namePickerView(_ namePickerView: NamePickerView, didSelectName name: String)
func namePickerViewShouldReload(_ namePickerView: NamePickerView) -> Bool
```
**Not Preferred**:
```swift
func didSelectName(namePicker: NamePickerViewController, name: String)
func namePickerShouldReload() -> Bool
```

## Protocol

In particular, when adding protocol conformance to a model, prefer adding a separate extension for the protocol methods. This keeps the related methods grouped together with the protocol and can simplify instructions to add a protocol to a class with its associated methods.

**Preferred**:
```swift
class ViewController: UIViewController {
  // class stuff here
}

// MARK: - UITableViewDelegate
extension UIViewController: UITableViewDelegate {
  // UITableViewDelegate methods
}

// MARK: - UICollectionViewDataSource
extension UIViewController: UICollectionViewDataSource {
  // UICollectionViewDataSource methods
}
```
**Not Preferred**:
```swift
class ViewController: UIViewController, UITableViewDelegate, UICollectionViewDataSource {
  // all methods
}
```

## Spacing

if/else/switch/while etc.
[![SwiftLint: opening_brace](https://img.shields.io/badge/SwiftLint-opening_brace-007A87.svg)](https://realm.github.io/SwiftLint/opening_brace.html)
[![SwiftLint: statement_position](https://img.shields.io/badge/SwiftLint-statement_position-007A87.svg)](https://realm.github.io/SwiftLint/statement_position.html)

**Preferred**:
```swift
if passed {
  // ...
} else {
  // ...
}
```
**Not Preferred**:
```swift
if passed
{
  // ...
}
else {
  // ...
}
```

Colons should be next to the identifier when specifying a type and next to the key in dictionary literals.
[![SwiftLint: colon](https://img.shields.io/badge/SwiftLint-colon-007A87.svg)](https://realm.github.io/SwiftLint/colon.html)

**Preferred**:
```swift
var abc: Bool = true
func abc(string: String) {}
```
**Not Preferred**:
```swift
var abc : Bool = true
var abc :Bool = true
func abc(string : String) {}
func abc(string :String) {}
```

# Computed Properties

For conciseness, if a computed property is read-only, omit the get clause. The get clause is required only when a set clause is provided.

**Preferred**:
```swift
var diameter: Double {
  return radius * 2
}
```
**Not Preferred**:
```swift
var diameter: Double {
  get {
    return radius * 2
  }
}
```

## Operators

Infix operators should have a single space on either side. Prefer parenthesis to visually group statements with many operators rather than varying widths of whitespace. This rule does not apply to range operators (e.g. 1...3) and postfix or prefix operators (e.g. guest? or -1).
[![SwiftLint: colon](https://img.shields.io/badge/SwiftLint-operator_usage_whitespace-007A87.svg)](https://realm.github.io/SwiftLint/operator_usage_whitespace.html)

**Preferred**:
```swift
let foo = 1 + 2
let foo = 1 > 2
let foo = !false
let range = 1...3
let range = 1..<3
```
**Not Preferred**:
```swift
let foo = 1+2
let foo = 1   + 2
let foo = 1   +    2
let foo=bar
let range = 1 ..<  3
```

## References

* [The Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines)
* [The Raywenderlich Swift Style Guide](https://github.com/raywenderlich/swift-style-guide)
* [The Airbnb Swift Style Guide](https://github.com/airbnb/swift)
* [The Trendyol Swift Style Guide](https://github.com/Trendyol/ios-guidelines/blob/master/code_style_guideline/code_style_guideline.md)
