//
//  NewGroupTableViewController.h
//  
//
//  Created by Jose Luis Rodriguez on 22/03/15.
//
//

#import <UIKit/UIKit.h>

@interface NewGroupTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (weak, nonatomic) IBOutlet UITextField *classField;
- (IBAction)cancel:(UIBarButtonItem *)sender;
- (IBAction)save:(UIBarButtonItem *)sender;

@end
