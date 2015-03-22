//
//  SignUserViewController.m
//  HackMTY
//
//  Created by Abner Castro Aguilar on 21/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import "SignUserViewController.h"
#import <Parse/Parse.h>

@interface SignUserViewController ()

@end

@implementation SignUserViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *signUserButton = [[UIBarButtonItem alloc] initWithTitle:@"Sign Up" style:UIBarButtonItemStyleDone target:self action:@selector(signUser)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelSign)];
    self.navigationItem.rightBarButtonItem = signUserButton;
    self.navigationItem.leftBarButtonItem = cancelButton;
}

- (void)signUser
{
    PFUser *newUser = [PFUser user];
    newUser.username = self.fieldEmail.text;
    newUser.email = self.fieldEmail.text;
    newUser.password = self.fieldPassword.text;
    [newUser setValue:self.fieldUsername.text forKey:@"user"];
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(!error){
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
}

- (void)cancelSign
{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}





@end













































