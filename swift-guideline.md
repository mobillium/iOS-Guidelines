# Mobillium Swift Style Guide

## Requirements

1. Install [SwiftLint](https://realm.github.io/SwiftLint/) by using CocoaPods.
2. Add [.swiftlint.yml](https://github.com/mobillium/iOS-Guidelines/blob/master/.swiftlint.yml) files to under Project folder. .swiftlint.yml file located inside of repo.

## Naming

**Variable name and function name should start with a lowercase character.** [![SwiftLint: identifier_name](https://img.shields.io/badge/SwiftLint-identifier_name-007A87.svg)](https://realm.github.io/SwiftLint/identifier_name.html)

<details>

**Preferred**:
```swift˜
var abc = true
func abc() {}
```

**Not Preferred**:
```swift
var Abc = true
func Abc() {}
```

</details>

**Type name and protocol name should start with an uppercase character.** [![SwiftLint: type_name](https://img.shields.io/badge/SwiftLint-type_name-007A87.svg)](https://realm.github.io/SwiftLint/type_name.html)

<details>

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

</details>

**Use compiler inferred context to write shorter, clear code.**

<details>

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

</details>

**Include a hint about type in a name if it would otherwise be ambiguous.**

<details>

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

 </details>

**Name booleans like `isSpaceship`, `hasSpacesuit`, etc.** This makes it clear that they are booleans and not other types.

<details>

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

</details>

**Use US English spelling to match Apple's API.**

<details>

 **Preferred**:
 ```swift
let color = "red"
 ```

 **Not Preferred**:
 ```swift
let colour = "red"
 ```

</details>

**Avoid Objective-C-style acronym prefixes.** This is no longer needed to avoid naming conflicts in Swift.

<details>

 **Preferred**:
 ```swift
 class Account {
  // ...
}
 ```

 **Not Preferred**:
 ```swift
 class MyAccount {
  // ...
}
 ```

</details>

## Patterns

**Prefer using `guard` at the beginning of a scope.**

<details>

#### Why?
It's easier to reason about a block of code when all `guard` statements are grouped together at the top rather than intermixed with business logic.

</details>

**Prefer immutable values whenever possible.** Use `map` and `compactMap` instead of appending to a new collection. Use `filter` instead of removing elements from a mutable collection.˜

**Access control should be at the strictest level possible.** Prefer `public` to `open` and `private` to `fileprivate` unless you need that behavior.

**Avoid global functions whenever possible.** Prefer methods within type definitions.

<details>

**Preferred**:
```swift
class Person {
  var bornAt: TimeInterval

  var age: Int {
    // ...
  }

  func jump() {
    // ...
  }
}
```

**Not Preferred**:
```swift
func age(of person, bornAt timeInterval) -> Int {
  // ...
}

func jump(person: Person) {
  // ...
}
```

</details>

**Use Swift's automatic enum values unless they map to an external source.** Add a comment explaining why explicit values are defined. [![SwiftLint: type_name](https://img.shields.io/badge/SwiftLint-redundant_string_enum_value-007A87.svg)](https://realm.github.io/SwiftLint/redundant_string_enum_value.html)

<details>

**Preferred**:
```swift
enum ErrorType: String {
  case error
  case warning
}

enum Planet: Int {
  case mercury
  case venus
  case earth
  case mars
  case jupiter
  case saturn
  case uranus
  case neptune
}
```

**Not Preferred**:
```swift
enum ErrorType: String {
  case error = "error"
  case warning = "warning"
}

enum Planet: Int {
  case mercury = 0
  case venus = 1
  case earth = 2
  case mars = 3
  case jupiter = 4
  case saturn = 5
  case uranus = 6
  case neptune = 7
}
```

</details>

**Default type methods to `static`.**

<details>

#### Why?
  If a method needs to be overridden, the author should opt into that functionality by using the `class` keyword instead.

**Preferred**:
```swift
class Fruit {
  static func eatFruits(_ fruits: [Fruit]) { ... }
}
```

**Not Preferred**:
```swift
class Fruit {
  class func eatFruits(_ fruits: [Fruit]) { ... }
}
```

</details>

**Prefer immutable values whenever possible.** Use `map` and `compactMap` instead of appending to a new collection. Use `filter` instead of removing elements from a mutable collection.

<details>

#### Why?
Mutable variables increase complexity, so try to keep them in as narrow a scope as possible.

**Preferred**:
```swift
var results = [SomeType]()
let results = input.map { transform($0) }
let results = input.compactMap { transformThatReturnsAnOptional($0) }
```

**Not Preferred**:
```swift
var results = [SomeType]()

for element in input {
  let result = transform(element)
  results.append(result)
}

for element in input {
  if let result = transformThatReturnsAnOptional(element) {
    results.append(result)
  }
}
```

</details>

**Never use the `default` case when `switch`ing over an enum.**

<details>

#### Why?
Enumerating every case requires developers and reviewers have to consider the correctness of every switch statement when new cases are added.

**Preferred**:
```swift
switch anEnum {
case .a:
  // ...
case .b, .c:
  // ...
}
```

**Not Preferred**:
```swift
switch anEnum {
case .a:
  // ...
default:
  // ...
}
```

</details>

**Default classes to `final`.**

<details>

#### Why?
  If a class needs to be overridden, the author should opt into that functionality by omitting the `final` keyword.

**Preferred**:
```swift
final class SettingsRepository {
  // ...
}
```

**Not Preferred**:
```swift
class SettingsRepository {
  // ...
}
```

</details>

**Check for nil rather than using optional binding if you don't need to use the value.** [![SwiftLint: type_name](https://img.shields.io/badge/SwiftLint-unused_optional_binding-007A87.svg)](https://realm.github.io/SwiftLint/unused_optional_binding.html)

<details>

#### Why?
Checking for nil makes it immediately clear what the intent of the statement is. Optional binding is less explicit.

**Preferred**:
```swift
var thing: String?

if thing != nil {
  // ...
}
```

**Not Preferred**:
```swift
var thing: String?

// WRONG
if let _ = thing {
  // ...
}
```

</details>

## Delegates

**When creating custom delegate methods, an unnamed first parameter should be the delegate source.** (UIKit contains numerous examples of this.)

<details>

**Preferred**:
```swift
func namePickerView(_ namePickerView: NamePickerView, didSelect name: String)
func namePickerViewShouldReload(_ namePickerView: NamePickerView) -> Bool
```

**Not Preferred**:
```swift
func didSelectName(namePicker: NamePickerViewController, name: String)
func namePickerShouldReload() -> Bool
```

</details>

## Protocol

**In particular, when adding protocol conformance to a model, prefer adding a separate extension for the protocol methods. This keeps the related methods grouped together with the protocol and can simplify instructions to add a protocol to a class with its associated methods.**

<details>

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

</details>

## Spacing

**if/else/switch/while etc.** [![SwiftLint: opening_brace](https://img.shields.io/badge/SwiftLint-opening_brace-007A87.svg)](https://realm.github.io/SwiftLint/opening_brace.html) [![SwiftLint: statement_position](https://img.shields.io/badge/SwiftLint-statement_position-007A87.svg)](https://realm.github.io/SwiftLint/statement_position.html)

<details>

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

</details>

**Colons should be next to the identifier when specifying a type and next to the key in dictionary literals.** [![SwiftLint: colon](https://img.shields.io/badge/SwiftLint-colon-007A87.svg)](https://realm.github.io/SwiftLint/colon.html)

<details>

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

</details>

# Computed Properties

**For conciseness, if a computed property is read-only, omit the get clause. The get clause is required only when a set clause is provided.**

<details>

**Preferred**:
```swift
var diameter: Double {
  return radius 2
}
```

**Not Preferred**:
```swift
var diameter: Double {
  get {
    return radius 2
  }
}
```

</details>

## Operators

**Infix operators should have a single space on either side. Prefer parenthesis to visually group statements with many operators rather than varying widths of whitespace. This rule does not apply to range operators (e.g. 1...3) and postfix or prefix operators (e.g. guest? or -1).** [![SwiftLint: colon](https://img.shields.io/badge/SwiftLint-operator_usage_whitespace-007A87.svg)](https://realm.github.io/SwiftLint/operator_usage_whitespace.html)

<details>

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

</details>

## References

* [The Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines)
* [The Raywenderlich Swift Style Guide](https://github.com/raywenderlich/swift-style-guide)
* [The Airbnb Swift Style Guide](https://github.com/airbnb/swift)
* [The Trendyol Swift Style Guide](https://github.com/Trendyol/ios-guidelines/blob/master/code_style_guideline/code_style_guideline.md)
