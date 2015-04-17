//
//  BOXSharedLinkViewController.h
//  BoxShareSDK
//
//  Copyright (c) 2015 BOX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoxContentSDK.h"

@protocol BOXSharedLinkViewControllerDelegate;

@interface BOXSharedLinkViewController : UITableViewController

- (instancetype)initWithContentClient:(BOXContentClient *)client
                             withItem:(BOXItem *)item;

- (instancetype)initWithContentClient:(BOXContentClient *)client
                               fileID:(NSString *)fileID;

- (instancetype)initWithContentClient:(BOXContentClient *)client
                             folderID:(NSString *)folderID;

- (instancetype)initWithContentClient:(BOXContentClient *)client
                           bookmarkID:(NSString *)bookmarkID;

/**
 *  Defaults to NO. If NO, a button will be shown to allow users to copy a shared link URL to the device's clipboard.
 */
@property (nonatomic, readwrite, assign) BOOL shouldHideCopyToClipboard;

/**
 *  Defaults to NO. If NO, a button will be shown to allow users to email or message a shared link URL.
 */
@property (nonatomic, readwrite, assign) BOOL shouldHideSendLinks;

@property (nonatomic, readwrite, weak) id<BOXSharedLinkViewControllerDelegate> delegate;

@end

@protocol BOXSharedLinkViewControllerDelegate <NSObject>

@optional

/**
 *  Implement to respond to the item's shared link being updated/removed
 *
 *  @param controller The BOXSharedLinkViewController the change occured on
 *
 *  @param item The BOXItem that was modified
 */

- (void)sharedLinkViewController:(BOXSharedLinkViewController *)controller didUpdateItem:(BOXItem *)item;

@end
