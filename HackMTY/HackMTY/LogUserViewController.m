//
//  LogUserViewController.m
//  HackMTY
//
//  Created by Abner Castro Aguilar on 21/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import "LogUserViewController.h"
#import <Parse/Parse.h>


@interface LogUserViewController ()

@end

@implementation LogUserViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *logInButton = [[UIBarButtonItem alloc] initWithTitle:@"Log In" style:UIBarButtonItemStyleDone target:self action:@selector(loginUser)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelLogin)];
    self.navigationItem.rightBarButtonItem = logInButton;
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    self.fieldEmail.delegate = self;
    self.fieldPassword.delegate = self;
}

- (void)loginUser
{
    if(self.fieldEmail.text.length == 0 || self.fieldPassword.text.length == 0){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ups" message:@"You must type an email and password correctly" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
        [PFUser logInWithUsernameInBackground:self.fieldEmail.text password:self.fieldPassword.text block:^(PFUser *user, NSError *error) {
            if(!error){
                //Metodo de un custom delegate
                [self performSegueWithIdentifier:@"loged" sender:nil];

            }
            else{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"An error occured while login. Please try again." preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:okAction];
                [self presentViewController:alert animated:YES completion:nil];
            }
        }];
    }
}
- (void)cancelLogin
{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.fieldEmail){
        [textField resignFirstResponder];
        [self.fieldPassword becomeFirstResponder];
    }
    else if(textField == self.fieldPassword){
        [textField resignFirstResponder];
    }
    return YES;
}


@end









































































































