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



- (IBAction)loginUser:(UIButton *)sender;
- (IBAction)signupUser:(UIButton *)sender;
@end
