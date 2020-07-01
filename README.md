[![Project Status](http://opensource.box.com/badges/active.svg)](http://opensource.box.com/badges)

Box iOS Share SDK
===================

##Note:

- The Box iOS Share SDK is in **Maintenance** mode. This means only critical bugs will be patched. However, new functionality and additional bug fixes may be added on occasion based on customer demand, but should not be expected.

This SDK allows you to show UI that allows users to view collaborators for their folders or create shared links for their items on BOX.

Developer Setup
---------------
* Ensure you have the latest version of [Xcode](https://developer.apple.com/xcode/) installed.
* We encourage you to use [Cocoa Pods](http://cocoapods.org/) to import the SDK into your project. Cocoa Pods is a simple, but powerful dependency management tool. If you do not already use Cocoa Pods, it's very easy to [get started](http://guides.cocoapods.org/using/getting-started.html).

Quickstart
----------
Step 1: Add to your Podfile
```
pod 'box-ios-share-sdk'
```
Step 2: Install
```
pod install
```
Step 3: Import
```objectivec
#import <BoxShareSDK/BoxShareSDK.h>
```
Step 4: Set the Box Client ID and Client Secret that you obtain from [creating a developer account](http://developers.box.com/)
```objectivec
[BOXContentClient setClientID:@"your-client-id" clientSecret:@"your-client-secret"];
```
Step 5: Launch a BOXSharedLinkViewController
```objectivec
BOXContentClient *contentClient = [BOXContentClient defaultClient];
BOXSharedLinkViewController *sharedLinkViewController = [[BOXSharedLinkViewController alloc] initWithContentClient:contentClient fileID:@"123"];

// You must push it to a UINavigationController (i.e. do not 'presentViewController')
UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:sharedLinkViewController];
[self presentViewController:navigationController animated:YES completion:nil];
```

Sample App
----------
A sample app can be found in the [BoxShareSDKSampleApp](../../tree/master/BoxShareSDKSampleApp) folder. To execute the sample app:
Step 1: Install Pods
```
cd BoxShareSDKSampleApp
pod install
```
Step 2: Open Workspace
```
open BoxShareSDKSampleApp.xcworkspace
```


Copyright and License
---------------------
Copyright 2015 Box, Inc. All rights reserved.

Licensed under the Box Terms of Service; you may not use this file except in compliance with the License.
You may obtain a copy of the License at https://www.box.com/legal/termsofservice/​
