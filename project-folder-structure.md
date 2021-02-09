# iOS Project Folder Structure

### Table of Contents

- [ProjectFolderTree](#projectfoldertree)
- [AppDelegate](#appdelegate)
- [Configuration](#configuration)
- [Resources](#resources)
- [Intent](#intent)
- [Protocols](#protocols)
- [Validation](#validation)
- [Constants](#constants)
- [DeepLink](#deepLink)
- [Singleton](#singleton)
- [Routing](#routing)
- [Helper](#helper)
- [Scenes](#scenes)

<a name="projectfoldertree"></a>
## ProjectFolderTree

```text
├── ProjectFolder

  ├── AppDelegate
    ├── AppDelegate.swift
    ├── AppDelegate+Firebase.swift
    ├── ...

  ├── Configuration
    ├── Release
      ├── -.plist
      ├── -.entitlements
      ├── sdk config files
    ├── Debug
      ├── -.plist
      ├── -.entitlements
      ├── sdk config files

  ├── Resources
    ├── Assets
      ├── Icons.xcassets
      ├── Images.xcassets
      ├── Colors.xcassets
    ├── Strings
      ├── General.strings
      ├── Error.strings
      ├── Placeholder.strings
      ├── Modules.strings
      ├── Components.strings
    ├── Fonts
      ├── Fonts files
    ├── Sounds
      ├── Sound files
    ├── Gif
      ├── Gif files

  ├── Intent
    ├── Model
      ├── Object Files
    ├── Enum
      ├── Enum Files

  ├── Protocols
    ├── Protocol files

  ├── Validation
    ├── Constants
      ├── ValidationConstants.swift
    ├── Classes
      ├── Custom files
    ├── Rules
      ├── Rules files

  ├── EventManager
    ├── Core
      ├── Core event files
    ├── Firebase
      ├── FirebaseEventProvider files
    ├── OtherProvider
      ├── OtherProvider files

  ├── Constants
    ├── Constants.swift
    ├── Globals.swift
    ├── DefaultsKeys.swift
    ├── NotificationNames.swift
    ├── NotificationParameterKeys.swift
    ├── DateFormats.swift
    ├── Other Constants files

  ├── DeepLink
    ├── DeepLink classes

  ├── Singleton
    ├── Singleton classes

  ├── Routing
    ├── Core
      ├── Core classes
    ├── Animator
      ├── Animator classes
    ├── Routes
      ├── AppStoreRoute
      ├── AppSettingsRoute
      ├── Other global routes
    ├── Transitions
      ├── Transitions classes

  ├── Helper
    ├── Helper classes

  ├── Scenes
    ├── Auth
      ├── SignIn
        ├── SignInViewController.swift
        ├── SignInViewModel.swift
        ├── SignInRouter.swift
        ├── SignInRoute.swift
      ├── SignUp
        ├── SignInViewController.swift
        ├── SignInViewModel.swift
        ├── SignInRouter.swift
        ├── SignInRoute.swift
      ├── ForgotPassword
        ├── ForgotPasswordViewController.swift
        ├── ForgotPasswordViewModel.swift
        ├── ForgotPasswordRouter.swift
        ├── ForgotPasswordRoute.swift
    ├── Agreement
      ├── AgreementViewController.swift
      ├── AgreementViewModel.swift
      ├── AgreementRouter.swift
      ├── AgreementRoute.swift
    ├── SceneName
      ├── SceneNameViewController.swift
      ├── SceneNameViewModel.swift
      ├── SceneNameRouter.swift
      ├── SceneNameRoute.swift
```


<a name="appdelegate"></a>
## AppDelegate
<details>
Main AppDelegate should contain just default native functions. All 3rd party libraries should be separated from AppDelegate as extensions. Apart from that, Universal Link Handler & Push Notification Handler should also be separated as extensions. This distinction should be made in classic extension naming. Example -> (AppDelegate + {3rd party library name})

```text
├── ProjectFolder
  ├── AppDelegate
    ├── AppDelegate.swift
    ├── AppDelegate+Firebase.swift
    ├── ...
```
</details>


<a name="configuration"></a>
## Configuration
<details>
Configuration folder should contain entitlements, plist files, briding-header files, yml files(if available).They should divide into folders by build config.

```text
├── ProjectFolder
  ├── Configuration
    ├── Release
      ├── -.plist
      ├── -.entitlements
      ├── sdk config files
    ├── Debug
      ├── -.plist
      ├── -.entitlements
      ├── sdk config files
```
</details>


<a name="resources"></a>
## Resources

> ....

```text
├── ProjectFolder
  ├── Resources
    ├── Assets
      ├── Icons.xcassets
      ├── Images.xcassets
      ├── Colors.xcassets
    ├── Strings
      ├── General.strings
      ├── Error.strings
      ├── Placeholder.strings
      ├── Modules.strings
      ├── Components.strings
    ├── Fonts
      ├── Fonts files
    ├── Sounds
      ├── Sound files
    ├── Gif
      ├── Gif files
```


<a name="intent"></a>
## Intent

> ....

```text
├── ProjectFolder
  ├── Intent
    ├── Model
      ├── Object Files
    ├── Enum
      ├── Enum Files
```


<a name="protocols"></a>
## Protocols

> ....

```text
├── ProjectFolder
  ├── Protocols
    ├── Protocol files
```


<a name="validation"></a>
## Validation

> ....

```text
├── ProjectFolder
  ├── Validation
    ├── Constants
      ├── ValidationConstants.swift
    ├── Classes
      ├── Custom files
    ├── Rules
      ├── Rules files
```


<a name="eventmanager"></a>
## EventManager

> ....

```text
├── ProjectFolder
  ├── EventManager
    ├── Core
      ├── Core event files
    ├── Firebase
      ├── FirebaseEventProvider files
    ├── OtherProvider
      ├── OtherProvider files
```


<a name="constants"></a>
## Constants

<details>

All constants used in App should be stored under the **Constants** folder.
Such as Globals.swift, NotificationKeys, UserDefaultsKeys, DateFormatter etc.
  - #### NotificationCenter
  NotificationCenter extension file should be used, notification names **NotificationNames.swift** and notification parameters **NotificationParameterKeys.swift** named under **Constants** folder.
  - #### UserDefaults
   **MSAUserDefaults** library should be used and defaults key should be stored under the **Constants** folder named as **DefaultsKeys.swift**.
  - #### DateFormatter
   **MSADateFormatter** library should be used, if need to use extension it should be named as **DateFormats.swift** and should be stored under the **Constants** folder.

```text
├── ProjectFolder
  ├── Constants
    ├── Constants.swift
    ├── Globals.swift
    ├── DefaultsKeys.swift
    ├── NotificationNames.swift
    ├── NotificationParameterKeys.swift
    ├── DateFormats.swift
    ├── Other Constants files
```
</details>

<a name="deepLink"></a>
## DeepLink

<details>

DeepLink files should be stored under the **DeepLink** folder.

```text
├── ProjectFolder
  ├── DeepLink
    ├── DeepLink classes
```
</details>

<a name="singleton"></a>
## Singleton

> ....

```text
├── ProjectFolder
  ├── Singleton
    ├── Singleton classes
```


<a name="routing"></a>
## Routing

> ....

```text
├── ProjectFolder
  ├── Routing
    ├── Core
      ├── Core classes
    ├── Animator
      ├── Animator classes
    ├── Routes
      ├── AppStoreRoute
      ├── AppSettingsRoute
      ├── Other global routes
    ├── Transitions
      ├── Transitions classes
```

<a name="helper"></a>
## Helper

> ....

```text
├── ProjectFolder
  ├── Helper
    ├── Helper classes
```


<a name="scenes"></a>
## Scenes

> ....

```text
├── ProjectFolder
  ├── Scenes
    ├── Auth
      ├── SignIn
        ├── SignInViewController.swift
        ├── SignInViewModel.swift
        ├── SignInRouter.swift
        ├── SignInRoute.swift
      ├── SignUp
        ├── SignInViewController.swift
        ├── SignInViewModel.swift
        ├── SignInRouter.swift
        ├── SignInRoute.swift
      ├── ForgotPassword
        ├── ForgotPasswordViewController.swift
        ├── ForgotPasswordViewModel.swift
        ├── ForgotPasswordRouter.swift
        ├── ForgotPasswordRoute.swift
    ├── Agreement
      ├── AgreementViewController.swift
      ├── AgreementViewModel.swift
      ├── AgreementRouter.swift
      ├── AgreementRoute.swift
    ├── SceneName
      ├── SceneNameViewController.swift
      ├── SceneNameViewModel.swift
      ├── SceneNameRouter.swift
      ├── SceneNameRoute.swift
```
