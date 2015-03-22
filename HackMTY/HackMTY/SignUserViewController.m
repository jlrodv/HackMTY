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
    
    self.fieldEmail.delegate = self;
    self.fieldPassword.delegate = self;
    self.fieldUsername.delegate = self;
}

- (void)signUser
{
    if(self.fieldEmail.text.length != 0 && self.fieldPassword.text.length   != 0 && self.fieldUsername.text.length != 0){
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
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ups!" message:@"You must fill all the fields to Sign Up" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction  = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
}

- (void)cancelSign
{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.fieldEmail){
        [textField resignFirstResponder];
        [self.fieldUsername becomeFirstResponder];
    }
    else if(textField == self.fieldUsername){
        [textField resignFirstResponder];
        [self.fieldPassword becomeFirstResponder];
    }
    else
        [textField resignFirstResponder];
    return YES;
}


@end













































