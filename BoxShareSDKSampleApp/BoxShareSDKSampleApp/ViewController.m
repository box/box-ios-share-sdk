//
//  ViewController.m
//  BoxShareSDKSampleApp
//
//  Created on 1/20/15.
//  Copyright (c) 2015 Box. All rights reserved.
//

#import "ViewController.h"
#import "BoxContentSDK.h"
#import "BOXSampleAppListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender
{
#error Set the client ID and client secret that can be retrieved by creating an application at http://developers.box.com
    [BOXContentClient setClientID:@"client_id" clientSecret:@"client_secret"];
    BOXContentClient *client = [BOXContentClient defaultClient];
    [client authenticateWithCompletionBlock:^(BOXUser *user, NSError *error) {
        if (error == nil) {
            BOXSampleAppListViewController *listController = [[BOXSampleAppListViewController alloc] initWithClient:client folderID:@"0"];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:listController];
            [self presentViewController:navigationController animated:YES completion:nil];
        }
    }];
}

@end
