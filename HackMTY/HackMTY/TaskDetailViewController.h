//
//  TaskDetailViewController.h
//  HackMTY
//
//  Created by Abner Castro Aguilar on 22/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TaskDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UITextView *textDescription;
@property (weak, nonatomic) IBOutlet UIButton *buttonShared;
- (IBAction)shareFolder:(UIButton *)sender;

@property (nonatomic, strong)PFObject *taskDetail;
@end
