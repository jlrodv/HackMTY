//
//  GroupTableViewCell.h
//  HackMTY
//
//  Created by Jose Luis Rodriguez on 21/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *groupNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *peopleLabel;
@property (weak, nonatomic) IBOutlet UIView *tag;

@end
