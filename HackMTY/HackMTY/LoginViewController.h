//
//  LoginViewController.h
//  HackMTY
//
//  Created by Abner Castro Aguilar on 21/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *fieldEmailLogin;
@property (weak, nonatomic) IBOutlet UITextField *fieldPasswordLogin;
@property (weak, nonatomic) IBOutlet UITextField *fieldEmailSignUp;
@property (weak, nonatomic) IBOutlet UITextField *fieldUsernameSignUp;
@property (weak, nonatomic) IBOutlet UITextField *fieldPasswordSignUp;

- (IBAction)loginUser:(UIButton *)sender;
- (IBAction)signupUser:(UIButton *)sender;
- (IBAction)hideKeyboard:(UITapGestureRecognizer *)sender;
@end
