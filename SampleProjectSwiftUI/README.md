# SampleProjectSwiftUI Project Standards

This document was prepared by reviewing the current repository structure and code examples. Its purpose is to preserve shared standards in new development and improve team-wide consistency.

## 1. Architecture and Layers

- The app is SwiftUI-based and organized around Scene-driven screens.
- The presentation layer follows a Scene + SceneModel pattern.
- Shared screen behaviors are managed through `BaseScene` and `BaseSceneModel`.
- Data flow follows the repository pattern.
- Domain models are located under `Core/DataProvider/Sources/Domain`, while API and repository implementations are under `Core/DataProvider/Sources/DataProvider`.

## 2. Modular Structure (SPM)

- Core modules are split into SPM packages:
  - `Core/Components`
  - `Core/DataProvider` (including Domain)
  - `Core/Network`
  - `Core/AssetsKit`
  - `Core/FontsKit`
  - `Core/LocalizationKit`
  - `Core/Utilities`
  - `Core/Router`
- Inter-module dependencies must be explicitly declared in `Package.swift` files.
- Before adding a new library, check whether the same need is already covered by an existing module.

## 3. Scene Standards (UI Layer)

- Each feature/screen should have at least two core files:
  - `...Scene.swift`
  - `...SceneModel.swift`
- UI belongs in `Scene`, while state and business rules belong in `SceneModel`.
- `SceneModel` classes should generally inherit from `BaseSceneModel`.
- `@Published` properties are preferred for state management.
- Shared loading and retry/error actions should be handled through `BaseScene`.

## 4. Routing and Navigation Standards

- Navigation uses custom destination protocols:
  - `DestinationProtocol`
  - `SheetDestinationProtocol`
- Destination enums should be kept in the related feature folder (for example: `AuthDestinations`, `AuthSheetDestinations`).
- Route decisions should be managed with destination enums + router, instead of being scattered inside Views.

## 5. Data and Network Standards

- Repository protocols should live in Domain, while concrete implementations should live in DataProvider.
- `async/await` is the standard approach for asynchronous operations.
- The API request/response layer should be separated via request models + mappers.
- Network responses should be mapped into Domain models before reaching the UI layer.

## 6. Configuration and Environment Setup

- Environment-based values are read from `Info.plist` and exposed through `AppConfig`.
- Build configuration is managed by `Debug.xcconfig` and `Release.xcconfig`.
- Prefer configuration-driven values over hard-coded strings.

## 7. Localization Standards

- Localization is centralized under `Core/LocalizationKit`.
- Language switching is managed by `LanguageManager`.
- Localization keys are accessed through `L10n`.
- Use localization keys instead of hard-coded UI text.

## 8. Asset and Font Standards

- Asset and font access must use SwiftGen-generated type-safe APIs.
- Avoid manually written magic-string asset/font names.
- SwiftGen outputs are stored in generated folders and should not be edited manually.

## 9. Code Quality and Lint Standards

- Project-wide rules in `.swiftlint.yml` are the source of truth.
- `unused_declaration` and `unused_import` analyzer rules are enabled, so unused code should not remain.
- Use `swiftlint:disable` only when necessary and with narrow scope.
- `fatalError` usage is restricted by a custom rule; use an alternative mechanism in non-test code.
- Follow line length and naming conventions.

## 10. Naming and File Organization

- SwiftUI screen names should follow `XxxScene`, and model names should follow `XxxSceneModel`.
- Destination enums should be named with feature + `Destinations`/`SheetDestinations` suffix.
- Extension files should follow the `Type+Extensions.swift` naming pattern.
- Feature files should be grouped under `SampleProjectSwiftUI/Scene/<Feature>`.

## 11. Test Standards

- Keep the corresponding test target for each core module.
- Add unit tests under the related module's `Tests` folder when adding new business logic.
- Use existing UITest targets for critical UI behavior scenarios.

## 12. New Feature Checklist

- Is the feature folder created under `Scene`?
- Are `Scene` and `SceneModel` separated clearly?
- Is a destination enum defined for routing?
- If required, is repository protocol + implementation separation preserved?
- Is UI text provided through localization keys?
- Are assets/fonts accessed via generated APIs?
- Were lint rules and tests run?

## 13. Quick Summary

The core standards of this project are: modular SPM structure, Scene/SceneModel separation, repository pattern, custom router, SwiftGen-based resource management, centralized localization, and SwiftLint-driven code quality. New code should extend this architecture, not bypass it.