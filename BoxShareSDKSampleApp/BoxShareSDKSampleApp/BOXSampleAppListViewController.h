//
//  BOXSampleAppListViewController.h
//  BoxShareSDKSampleApp
//
//  Created on 1/29/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BOXContentClient;
@class BOXFolder;

@interface BOXSampleAppListViewController : UITableViewController

- (instancetype)initWithClient:(BOXContentClient *)client folderID:(NSString *)folderID;

@end
