//
//  LoginViewController.m
//  HackMTY
//
//  Created by Abner Castro Aguilar on 21/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import "LoginViewController.h"
#import "LogUserViewController.h"
#import "SignUserViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    
}


#pragma mark IBActions
- (IBAction)loginUser:(UIButton *)sender
{
    LogUserViewController *logView = [[LogUserViewController alloc] initWithNibName:@"LogUserViewController" bundle:nil];
    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:logView];
    [self presentViewController:nv animated:YES completion:nil];
}

- (IBAction)signupUser:(UIButton *)sender
{
    SignUserViewController *signView = [[SignUserViewController alloc] initWithNibName:@"SignUserViewController" bundle:nil];
    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:signView];
    [self presentViewController:nv animated:YES completion:nil];
    
}


@end



















































































































