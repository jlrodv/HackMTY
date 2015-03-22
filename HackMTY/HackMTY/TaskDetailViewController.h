//
//  TaskDetailViewController.h
//  HackMTY
//
//  Created by Abner Castro Aguilar on 22/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <DropboxSDK/DropboxSDK.h>

@interface TaskDetailViewController : UIViewController <DBRestClientDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIButton *buttonShared;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
- (IBAction)shareFolder:(UIButton *)sender;

@property (nonatomic, strong)PFObject *taskDetail;
@property (nonatomic, strong)DBRestClient *restClient;
@end
