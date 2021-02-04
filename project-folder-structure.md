# iOS Project Folder Structure

### Table of Contents

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
