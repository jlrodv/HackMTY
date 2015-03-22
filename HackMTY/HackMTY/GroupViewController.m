//
//  GroupViewController.m
//  
//
//  Created by Jose Luis Rodriguez on 21/03/15.
//
//

#import "GroupViewController.h"
#import <Parse/Parse.h>
#import "MultiPeerObject.h"
@interface GroupViewController ()
@property (nonatomic, strong) NSArray *groups;
@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Group";
        NSLog(@"hir");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(invitationReceived:) name:@"invitation" object:nil];

    
    // Do any additional setup after loading the view from its nib.
}

-(void)invitationReceived:(NSNotification *)notification{
    
    NSLog(@"invited %@", [[notification valueForKey:@"userInfo"] objectForKey:@"peer"]);
    
    UIAlertController *action = [UIAlertController alertControllerWithTitle:@"New Invitation" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *make = [UIAlertAction actionWithTitle:@"Accept" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
    
        void(^invitationHandler)(BOOL, MCSession *) = [[notification valueForKey:@"userInfo"] objectForKey:@"invitation"];
        invitationHandler(YES,[[MultiPeerObject sharedManager] session]);
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [action addAction:cancel];
    [action addAction:make];
    
    [self presentViewController:action animated:YES completion:nil];
}

-(void)viewDidAppear:(BOOL)animated{
    [self queryGroups];

}

-(void)queryGroups{

    PFQuery *query = [PFQuery queryWithClassName:@"group"];
    [query whereKey:@"participants" equalTo:[PFUser currentUser]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error){
    
        self.groups = array;
        [self.table reloadData];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.groups.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:@"groupCell"];
    
    UILabel *group = (UILabel *)[cell viewWithTag:2];
    group.text = [[self.groups objectAtIndex:indexPath.row] valueForKey:@"name"];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd/MM/yy"];
    
    UILabel *dueDate = (UILabel *)[cell viewWithTag:3];
    dueDate.text = [format stringFromDate:[[self.groups objectAtIndex:indexPath.row] valueForKey:@"dueDate"]];
    
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 83;

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
