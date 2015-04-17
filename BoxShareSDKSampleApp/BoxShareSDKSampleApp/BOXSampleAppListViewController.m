//
//  BOXSampleAppListViewController.m
//  BoxShareSDKSampleApp
//
//  Created on 1/29/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "BOXSampleAppListViewController.h"

#import "BoxContentSDK.h"
#import "BOXCollaborationListViewController.h"
#import "BOXSharedLinkViewController.h"

@interface BOXSampleAppListViewController ()

@property (nonatomic, readwrite, strong) BOXContentClient *client;
@property (nonatomic, readwrite, strong) NSString *folderID;
@property (nonatomic, readwrite, strong) BOXFolder *folder;

@property (nonatomic, readwrite, strong) NSArray *items;

@end

@implementation BOXSampleAppListViewController

- (instancetype)initWithClient:(BOXContentClient *)client folderID:(NSString *)folderID
{
    if (self = [super init]) {
        _client = client;
        _folderID = folderID;
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    BOXFolderRequest *request = [self.client folderInfoRequestWithID:self.folderID];
    request.requestAllFolderFields = YES;
    [request performRequestWithCompletion:^(BOXFolder *folder, NSError *error) {
        self.folder = folder;
        self.navigationItem.title = self.folder.name;

        if ([self.folder isRoot]) {
            UIBarButtonItem *logoutItem = [[UIBarButtonItem alloc] initWithTitle:@"Log Out"
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:self
                                                                          action:@selector(logOut:)];
            self.navigationItem.leftBarButtonItem = logoutItem;
        }
    }];

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(invite:)];
    UIBarButtonItem *share = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(share:)];
    self.navigationItem.rightBarButtonItems = @[item, share];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    BOXFolderItemsRequest *request = [self.client folderItemsRequestWithID:self.folderID];
    [request performRequestWithCompletion:^(NSArray *items, NSError *error) {
        self.items = items;
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    // Configure the cell...
    BOXItem *currentItem = (BOXItem *)self.items[indexPath.row];
    cell.textLabel.text = currentItem.name;
    cell.detailTextLabel.text = [currentItem isFolder] ? @"Folder" : @"Item";

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOXItem *selectedItem = (BOXItem *)self.items[indexPath.row];

    if ([selectedItem isFolder]) {
        BOXSampleAppListViewController *newListViewController = [[BOXSampleAppListViewController alloc] initWithClient:self.client folderID:selectedItem.modelID];
        [self.navigationController pushViewController:newListViewController animated:YES];
    } else {
        BOXSharedLinkViewController *shareController = [[BOXSharedLinkViewController alloc] initWithContentClient:self.client withItem:selectedItem];
        [self.navigationController pushViewController:shareController animated:YES];
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Actions

- (void)invite:(id)source
{
    BOXCollaborationListViewController *collaborationController = [[BOXCollaborationListViewController alloc] initWithContentClient:self.client folderID:self.folder.modelID];
    [self.navigationController pushViewController:collaborationController animated:YES];
}

- (void)share:(id)source
{
    BOXSharedLinkViewController *shareController = [[BOXSharedLinkViewController alloc] initWithContentClient:self.client withItem:self.folder];
    [self.navigationController pushViewController:shareController animated:YES];
}

//FIXME: Add handling of logout notification
- (void)logOut:(id)source
{
    [self.client logOut];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
