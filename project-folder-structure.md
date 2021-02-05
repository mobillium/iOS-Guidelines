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

> ....

```text
├── ProjectFolder
  ├── AppDelegate
    ├── AppDelegate.swift
    ├── AppDelegate+Firebase.swift
    ├── ...
```


<a name="configuration"></a>
## Configuration

> ....

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
<details>
Multiple protocols used in App should store under the Protocols folder. These protocols should divided by their usage purpose such as Apple SignIn Protocol, Facebook SignIn Protocol.

```text
├── ProjectFolder
  ├── Protocols
    ├── Protocol files
```
</details>


<a name="validation"></a>
## Validation
<details>
All validation files should store under the Validation folder. The core files and custom files should store under the Classes folder. If you are using custom rules, these rules should store under the Rules folder divided by their usage. All the constants such as password minimum - maximum lenght should store under the Constants folder with ValidationConstants.swift naming.

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
</details>

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

> ....

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


<a name="deepLink"></a>
## DeepLink

> ....

```text
├── ProjectFolder
  ├── DeepLink
    ├── DeepLink classes
```


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
