# iOS Project Folder Structure

### Table of Contents

- [Project](#project)
  - [AppDelegate](#appdelegate)
  - [Configuration](#configuration)
  - [Entity](#entity)
  - [Protocols](#protocols)
  - [Validation](#validation)
  - [EventManager](#eventmanager)
  - [Constants](#constants)
  - [DeepLink](#deepLink)
  - [Singleton](#singleton)
  - [Routing](#routing)
  - [Helper](#helper)
  - [Scenes](#scenes)


- [Utilities](#utilities)
  - [Extensions](#uitilities-extensions)
  - [Constants](#uitilities-constants)
  - [Helper](#uitilities-helper)


- [UIComponents](#uicomponents)
  - [Resources](#uicomponents-resources)
  - [Extensions](#uicomponents-extensions)
  - [Protocol](#uicomponents-protocol)
  - [UIButton](#uicomponents-uibutton)
  - [Builder](#uicomponents-builder)
  - [Cell](#uicomponents-cell)


- [DataProvider](#dataprovider)
  - [Core](#dataprovider-core)
  - [Manager](#dataprovider-manager)
  - [Entity](#dataprovider-entity)
  - [Requests](#dataprovider-requests)

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

  ├── Entity
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


├── Utilities

  ├── Extensions
    ├── UIImage+Extensions.swift
    ├── String+Extensions.swift
    ├── ...

  ├── Constants
    ├── Closures.swift
    ├── ...

  ├── Helper
    ├── KeyboardHelper.swift
    ├── ...


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
      ├── Fonts files
    ├── Sounds
      ├── Sound files
    ├── Gif
      ├── Gif files

  ├── Extensions
    ├── UIImage+Extensions.swift
    ├── UICollection+Extensions.swift
    ├── ...

  ├── Protocol
    ├── ReusableView.swift
    ├── ...

  ├── UIButton
    ├── PrimaryButton.swift
    ├── ...

  ├── Builder
    ├── UILabelBuilder.swift
    ├── UIButtonBuilder.swift
    ├── ...

  ├── Cell
    ├── UserCell.swift
    ├── ProductCell.swift
    ├── ...


├── DataProvider

  ├── Core
    ├── Typealias.swift
    ├── RequestProtocol.swift
    ├── RequestMethod.swift
    ├── RequestEncoding.swift
    ├── DataProviderProtocol.swift
    ├── ...

  ├── Manager
    ├── DataManager.swift
    ├── ...

  ├── Entity
    ├── User
      ├── User.swift
      ├── Gender.swift
      ├── ...
    ├── Auth.swift
    ├── ...

  ├── Requests
    ├── User
      ├── GetUserRequest.swift
      ├── UpdateUserRequest.swift
      ├── ...
    ├── VersionControlRequest.swift
    ├── ...
```


# Project
<a name="project"></a>

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

<a name="entity"></a>
## Entity
<details>
It contains the models we create custom and the enums we need. As an example of custom models, models that we format the responses from web services by to specific logic.

```text
├── ProjectFolder
  ├── Entity
    ├── Model
      ├── Object Files
    ├── Enum
      ├── Enum Files
```
</details>


<a name="protocols"></a>
## Protocols
<details>
Multiple protocols used in App should store under the Protocols folder. These protocols should divided by their usage purpose such as AppleSignInProtocol, FacebookSignInProtocol.

```text
├── ProjectFolder
  ├── Protocols
    ├── Protocol files
```
</details>


<a name="validation"></a>
## Validation
<details>
All validation files should store under the Validation folder. The core files and custom files should store under the Classes folder. If you are using custom rules, these rules should store under the Rules folder divided by their usage. All the constants such as password minimum - maximum length should store under the Constants folder with ValidationConstants.swift naming.

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
<details>
....

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
</details>

<a name="constants"></a>
## Constants
<details>

All constants used in App should be stored under the **Constants** folder.
Such as Globals.swift, NotificationKeys, UserDefaultsKeys, DateFormatter etc.
  - #### NotificationCenter
  NotificationCenter extension file should be used, notification names **NotificationNames.swift** and notification parameters **NotificationParameterKeys.swift** named under **Constants** folder.
  - #### UserDefaults
   **MobilliumUserDefaults** library should be used and defaults key should be stored under the **Constants** folder named as **DefaultsKeys.swift**.
  - #### DateFormatter
   **MobilliumDateFormatter** library should be used, if need to use extension it should be named as **DateFormats.swift** and should be stored under the **Constants** folder.

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
<details>
Each singleton pattern which we need to use will keep under separated singleton classes and files, like AuthSingleton.swift, etc.

```text
├── ProjectFolder
  ├── Singleton
    ├── Singleton classes
```
</details>


<a name="routing"></a>
## Routing
<details>
The router will be under the related modules.

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
</details>

<a name="helper"></a>
 ## Helper
 <details>
 Helper should be divided into swift files according to their process rather than a general helper. For example FirebaseHelper.swift, StripeHelper.swift. Helpers should be under the **Helper** folder.

 ```text
 ├── ProjectFolder
   ├── Helper
     ├── Helper classes
 ```
 </details>

<a name="scenes"></a>
## Scenes
<details>
Scenes should be divided under the **Scenes** folder. If a scene has flow for more than one scene it should be separated to another folder.

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
</details>



# Utilities
<a name="uitilities"></a>

<a name="uitilities-extensions"></a>
## Extensions
<details>

Extensions folder should contain all extensions except DataProvider extensions. Extension files should be separated by their classes and usage such as UIImage+Extensions.swift, String+Extensions.swift etc.

```text
├── Utilities
  ├── Extensions
    ├── UIImage+Extensions.swift
    ├── String+Extensions.swift
    ├── ...
```
</details>

<a name="uitilities-constants"></a>
## Constants
<details>

Constants folder should contain files such as Closures.swift and separated by their usage.

```text
├── Utilities
  ├── Constants
    ├── Closures.swift
    ├── ...
```
</details>

<a name="uitilities-helper"></a>
## Helper
<details>

Helper folder should contain files such as KeyboardHelper.swift and separated by their usage.

```text
├── Utilities
  ├── Helper
    ├── KeyboardHelper.swift
    ├── ...
```
</details>



# UIComponents
<a name="uicomponents"></a>
UIComponents should contain Resources, CustomViews and Builders. The files of the resources created with the SwiftGen will be here.
<a name="uicomponents-resources"></a>
## Resources
<details>
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
</details>

<a name="uicomponents-extensions"></a>
## Extensions
<details>
Each component extensions (FILE_NAME+Extension.swift) should be kept in a separate file and these files should be under the Extensions folder. 

```text
├── UIComponents

  ├── Extensions
    ├── UIImage+Extensions.swift
    ├── UICollection+Extensions.swift
    ├── ...
```
</details>

<a name="uicomponents-protocol"></a>
## Protocol
<details>
Protocols should be under the Protocol folder. 

```text
├── UIComponents

  ├── Protocol
    ├── ReusableView.swift
    ├── ...
```
</details>

<a name="uicomponents-uibutton"></a>
## UIButton
<details>
Every custom button should be under UIButton folder.

```text
├── UIComponents

  ├── UIButton
    ├── PrimaryButton.swift
    ├── ...
```
</details>

<a name="uicomponents-builder"></a>
## Builder
<details>
Builders for UIComponents should be kept in a separate file and these files should be under the Builder folder. 

```text
├── UIComponents

  ├── Builder
    ├── UILabelBuilder.swift
    ├── UIButtonBuilder.swift
    ├── ...
```
</details>

<a name="uicomponents-cell"></a>
## Cell
<details>
Every custom cell should be under Cell folder.

```text
├── UIComponents

  ├── Cell
      ├── UserCell.swift
      ├── ProductCell.swift
      ├── ...
```
</details>



# DataProvider
<a name="dataprovider"></a>

<a name="dataprovider-core"></a>
## Core
<details>

Core folder should contains Protocols, Request Encodings and Typealiases related with DataProvider. If there is an extension needed on DataProvider it should store in DataProvider. The main aim is that DataProvider must not be depended other modules or app. It should work if it is extract from the main app.

```text
├── DataProvider

  ├── Core
    ├── Typealias.swift
    ├── RequestProtocol.swift
    ├── RequestMethod.swift
    ├── RequestEncoding.swift
    ├── DataProviderProtocol.swift
    ├── ...
```
</details>

<a name="dataprovider-manager"></a>
## Manager
<details>

Manager should contains DataManager class which is a manager of all requests.

```text
├── DataProvider

  ├── Manager
    ├── DataManager.swift
    ├── ...
```
</details>

<a name="dataprovider-entity"></a>
## Entity
<details>

Entity should contains an all object models of app. These models should separated by their relations and grouped by folders.

```text
├── DataProvider

  ├── Entity
    ├── User
      ├── User.swift
      ├── Gender.swift
      ├── ...
    ├── Auth.swift
    ├── ...
```
</details>

<a name="dataprovider-requests"></a>
## Requests
<details>

Requests should contains an all Api requests of app. These requests should seperated by their relations and grouped by folders.

```text
├── DataProvider

  ├── Requests
    ├── User
      ├── GetUserRequest.swift
      ├── UpdateUserRequest.swift
      ├── ...
    ├── VersionControlRequest.swift
    ├── ...
```
</details>
