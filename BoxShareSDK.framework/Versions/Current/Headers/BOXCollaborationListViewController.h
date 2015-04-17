//
//  BOXCollaborationListViewController.h
//  BoxShareSDK
//
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BoxContentSDK.h"

#import <UIKit/UIKit.h>

@protocol BOXCollaborationItemRefreshDelegate;

@interface BOXCollaborationListViewController : UITableViewController

@property (nonatomic, readwrite, weak) id<BOXCollaborationItemRefreshDelegate> delegate;

- (instancetype)initWithContentClient:(BOXContentClient *)client
                             folderID:(NSString *)folderID;

- (instancetype)initWithContentClient:(BOXContentClient *)client
                               folder:(BOXFolder *)folder;

@end

@protocol BOXCollaborationItemRefreshDelegate <NSObject>

@optional

/**
 *  Called when the view controller refreshes its list of collaborators
 *
 *  @param folder The folder that the user is viewing collaborators for
 */

- (void)didRefreshCollaboratedFolder:(BOXFolder *)folder;

/**
 *  Called after the view controller fetched the collaborators for the folder
 *
 *  @param collaborations An array of BOXCollaboration objects
 */

- (void)didFetchFolderCollaborations:(NSArray *)collaborations;

@end