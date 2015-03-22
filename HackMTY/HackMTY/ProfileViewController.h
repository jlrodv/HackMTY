//
//  ProfileViewController.h
//  HackMTY
//
//  Created by Abner Castro Aguilar on 22/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageProfile;
@property (weak, nonatomic) IBOutlet UITextField *textFieldUsername;
@property (weak, nonatomic) IBOutlet UITableView *tableProfile;
- (IBAction)selectProfilePicture:(UITapGestureRecognizer *)sender;
@end
