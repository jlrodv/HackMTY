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
    self.buttonSign.layer.cornerRadius = 5.0;
    self.buttonSign.layer.borderColor = [[UIColor colorWithRed:91.0/255.0f green:49.0/255.0f blue:141.0/255.0f alpha:1.0f] CGColor];
    self.buttonSign.layer.borderWidth = 1.0;
    
    self.buttonLogin.layer.cornerRadius = 5.0;
    self.buttonLogin.layer.borderColor = [[UIColor colorWithRed:91.0/255.0f green:49.0/255.0f blue:141.0/255.0f alpha:1.0f] CGColor];
    self.buttonLogin.layer.borderWidth = 1.0;
}


#pragma mark IBActions
- (IBAction)loginUser:(UIButton *)sender
{
   
}

- (IBAction)signupUser:(UIButton *)sender
{
   
    
}


@end



















































































































