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
    [BOXContentClient setClientID:@"1vyz7z7abi0ic3j3cvto0tj43og52ksx" clientSecret:@"15epGRyzmTnhlWOmEekJLY4SD2ZKWgsE"];
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
