//
//  NewGroupTableViewController.m
//  
//
//  Created by Jose Luis Rodriguez on 22/03/15.
//
//

#import "NewGroupTableViewController.h"
#import "MultiPeerObject.h"
#import <Parse/Parse.h>

@interface NewGroupTableViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) NSMutableArray *accepted;
@property (nonatomic, strong) NSDate *date;
@end

@implementation NewGroupTableViewController

- (void)viewDidLoad {
    self.date = [[NSDate alloc] init];
    [super viewDidLoad];
    self.accepted = [[NSMutableArray alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(teamAdded:) name:@"addedTeam" object:nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)teamAdded:(NSNotification *)notification{
    
    NSLog(@"added %@", self.accepted);
    
    self.accepted = [[notification valueForKey:@"userInfo"] objectForKey:@"accepted"];
    
    self.teamName.text = [MultiPeerObject mailFromPeer:[self.accepted firstObject]];
    
    NSLog(@"%@", [MultiPeerObject objFromPeer:[self.accepted firstObject]]);

}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    UIDatePicker *picker = [[UIDatePicker alloc] init];
    [picker setMinimumDate:[NSDate date]];
    [picker setDatePickerMode:UIDatePickerModeDate];
    [textField setInputView:picker];
    
    [picker addTarget:self action:@selector(valueForPicker:) forControlEvents:UIControlEventValueChanged];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd/MM/yy"];
    self.dateField.text = [format stringFromDate:picker.date];
    self.date = picker.date;
}

-(void)valueForPicker:(UIDatePicker * )picker{

    self.date = picker.date;
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd/MM/yy"];
    self.dateField.text = [format stringFromDate:picker.date];
}

#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)cancel:(UIBarButtonItem *)sender {
}

- (IBAction)save:(UIBarButtonItem *)sender {
    
    PFObject *obj = [PFObject objectWithClassName:@"group"];
    [obj setValue:self.nameField.text forKey:@"name"];
    [obj setValue:self.date forKey:@"dueDate"];
    [obj setValue:self.classField.text forKey:@"class"];
    
    [obj saveInBackgroundWithBlock:^(BOOL succeed, NSError *error){
        
        if(!error&&succeed){
            NSLog(@"otro");
            PFRelation *rel = [obj relationForKey:@"participants"];
            [rel addObject:[PFUser currentUser]];
            
            [obj saveInBackground];
            
            PFQuery *query = [PFQuery queryWithClassName:@"_User"];
            [query getObjectInBackgroundWithId:[MultiPeerObject objFromPeer:[self.accepted firstObject]] block:^(PFObject *object, NSError *error){
                NSLog(@"aqui");
                if(object){
                
                    PFRelation *rela = [obj relationForKey:@"participants"];
                    [rela addObject:object];
                    [obj saveInBackground];
                    
                    [self dismissViewControllerAnimated:YES completion:nil];
                
                }
                else{
                
                    [self dismissViewControllerAnimated:YES completion:nil];

                }
            
            }];
        }
    
    
    }];
    
}
@end
