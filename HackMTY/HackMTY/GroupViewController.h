//
//  GroupViewController.h
//  
//
//  Created by Jose Luis Rodriguez on 21/03/15.
//
//

#import <UIKit/UIKit.h>

@interface GroupViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end
