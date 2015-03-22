//
//  HomeworkViewController.h
//  HackMTY
//
//  Created by Abner Castro Aguilar on 21/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeworkViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableHomework;
@property (weak, nonatomic) IBOutlet UISegmentedControl *buttonSwitch;
- (IBAction)switchHomewroks:(UISegmentedControl *)sender;



@end
