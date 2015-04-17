//
//  BOXCollaborationRoleViewController.h
//  BOXShareSDK
//
//  Created on 1/22/2015.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BoxContentSDKConstants.h"

#import <UIKit/UIKit.h>

@class BOXCollaboration;
@class BOXFolder;
@class BOXUserMini;

@protocol BOXCollaborationRoleViewControllerDelegate;

@interface BOXCollaborationRoleViewController : UITableViewController

@property (nonatomic, readwrite, weak) id<BOXCollaborationRoleViewControllerDelegate> delegate;
@property (nonatomic, readonly, strong) BOXCollaboration *collaboration;

+ (NSString *)localizedTitleForCollaborationRole:(BOXCollaborationRole *)role;
+ (NSString *)localizedDescriptionForCollaborationRole:(BOXCollaborationRole *)role;

- (id)initWithCollaboration:(BOXCollaboration *)collaboration
                     folder:(BOXFolder *)folder
                currentUser:(BOXUserMini *)currentUser
            currentUserRole:(BOXCollaborationRole *)currentUserRole
         isNewCollaboration:(BOOL)isNew;

@end

@protocol BOXCollaborationRoleViewControllerDelegate <NSObject>

@optional

- (void)collaborationRoleViewController:(BOXCollaborationRoleViewController *)controller didSelectNewRole:(BOXCollaborationRole *)newRole;
- (void)collaborationRoleViewController:(BOXCollaborationRoleViewController *)controller didSelectToRemoveCollaboration:(BOXCollaboration *)collaboration;
- (void)collaborationRoleViewController:(BOXCollaborationRoleViewController *)controller didDisappearWithSelectedRole:(BOXCollaborationRole *)newRole;

@end