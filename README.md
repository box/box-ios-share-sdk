[![Project Status](http://opensource.box.com/badges/active.svg)](http://opensource.box.com/badges)

Box iOS Share SDK
===================

This SDK allows you to show UI that allows users to view collaborators for their folders or create shared links for their items on BOX.

<img src="https://cloud.box.com/shared/static/3n48d1ni4ypeo1qpqhd85hotmpyorlgo.png" width="200"/>
<img src="https://cloud.box.com/shared/static/udcf54nt2wq39i6d3wjg2f7czcnlbqpo.png" width="200"/>
<img src="https://cloud.box.com/shared/static/tv6htc9ls4k2fbwkajh5icn7mmp259xj.png" width="200"/>

Developer Setup
---------------
* Ensure you have the latest version of [XCode](https://developer.apple.com/xcode/) installed.
* We encourage you to use [Cocoa Pods](http://cocoapods.org/) to import the SDK into your project. Cocoa Pods is a simple, but powerful dependency management tool. If you do not already use Cocoa Pods, it's very easy to [get started](http://guides.cocoapods.org/using/getting-started.html).

Quickstart
----------
Step 1: Add to your Podfile
```
source 'https://github.com/box/box-ios-podspecs.git'
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

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
