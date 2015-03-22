//
//  LoginViewController.m
//  HackMTY
//
//  Created by Abner Castro Aguilar on 21/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    
}

#pragma mark TextField Delegate
- (IBAction)loginUser:(UIButton *)sender
{
    NSString *email = [self.fieldEmailLogin.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.fieldPasswordLogin.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if(email.length != 0 || password.length != 0)
    {
        [PFUser logInWithUsernameInBackground:email password:password block:^(PFUser *user, NSError *error) {
            if(!error){
                
            }
            else{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"There was an error while login. Please try again" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:okAction];
                [self presentViewController:alert animated:YES completion:nil];
            }
        }];
    }
    else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ups!" message:@"You must introduce a correct username or email." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

- (IBAction)signupUser:(UIButton *)sender
{
    NSString *email = [self.fieldEmailSignUp.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *username = [self.fieldUsernameSignUp.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.fieldPasswordSignUp.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if(email.length !=0 || username.length != 0 || password.length != 0){
        PFUser *user = [PFUser user];
        user.username = email;
        user.email = email;
        user.password = password;
        [user setValue:username forKey:@"user"];
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(!error){
                
            }
            else{
                
            }
        }];
        
    }
}

- (IBAction)hideKeyboard:(UITapGestureRecognizer *)sender
{
    //Return textfields to their places
    
    //Hide keyboard
    [self.view endEditing:YES];
}
@end



















































































































