# Continuous Integration and Delivery  

## Introduction
Mobillium uses Bitrise for CI/CD operation. Mobillium has 3 types of trigger mechanism on Bitrise. One of them is triggered when a developer pushes a commit on any branch which is called **Primary** second one is triggered when a developer pushes a commit on release branch which is called **Deploy** and the last one is triggered when a developer execute a command on Slack which is called **DeployTest**.

## Primary Workflow
As mentioned before this workflow is triggered every push. In this workflow Bitrise sending repository to SonarQube for analize code quality.

##### Steps
```text
├── Bitrise Cache Pull        -> Retrive cache from previous workflow
├── Activate SSH              -> Setup SSH key for current workflow
├── Git Clone Repository      -> Clone repository from Git
├── SonarQube Scan            -> Send repo to SonarQube for scan
├── Bitrise Cache Push        -> Push the cached files
```

## Deploy Workflow
Since Mobillium uses git-flow during the development our developers create a release branches for release a version. These branches created with the version numbers such as **release/1.2.0**. In this workflow Bitrise gets an archive on release configuration and deploy it to the AppStore Connect.

##### Steps
```text
├── Bitrise Cache Pull        -> Retrive cache from previous workflow
├── Activate SSH              -> Setup SSH key for current workflow
├── Git Clone Repository      -> Clone repository from Git
├── CocoaPods install         -> Install CocoaPods dependencies
├── App Version Script        -> Get desired version number of app from branch name
├── Set Version/Build number  -> Set version and build number of app
├── Code signing              -> Install certificates and provision profiles
├── Xcode archive             -> Archive the app with release config
├── Deploy to Appstore        -> Deploy .ipa to AppStore Connect
├── Bitrise Cache Push        -> Push the cached files
├── Git Tag                   -> Tag the commit with version & build number
├── Send Slack Message        -> Send a message to Slack with build informations
```

## DeployTest Workflow
As mentioned before Mobillium uses git-flow during the development so every feature developed on feature branches. During the development phase developers need to send a test version to QA specialist for testing the feature. In this workflow developers can get an archive of app from specific branch with different environment. For trigger this workflow developers need to enter a Slack command with **branch name**, **environment name** and **desired version**. In this workflow Bitrise gets an archive from branch that developer enters with desired version and configuration that developer wants.

##### Steps
```text
├── Bitrise Cache Pull        -> Retrive cache from previous workflow
├── Activate SSH              -> Setup SSH key for current workflow
├── Git Clone Repository      -> Clone repository from Git
├── CocoaPods install         -> Install CocoaPods dependencies
├── Set Version/Build number  -> Set version and build number of app
├── Code signing              -> Install certificates and provision profiles
├── Xcode archive             -> Archive the app with release config
├── Deploy to Appstore        -> Deploy .ipa to AppStore Connect
├── Bitrise Cache Push        -> Push the cached files
├── Send Slack Message        -> Send a message to Slack with build informations
```
