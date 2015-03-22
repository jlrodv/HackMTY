//
//  GroupViewController.m
//  
//
//  Created by Jose Luis Rodriguez on 21/03/15.
//
//

#import "GroupViewController.h"

@interface GroupViewController ()

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Group";
        NSLog(@"hir");
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return 5;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:@"groupCell"];
//    cell.groupNameLabel.text = @"Swift Program";
//    NSDateFormatter *format = [[NSDateFormatter alloc] init];
//    [format setDateFormat:@"dd/MM/yy"];
//    cell.dateLabel.text = [format stringFromDate:[NSDate date]];
//    cell.peopleLabel.text = [NSString stringWithFormat:@"%@ people", [NSNumber numberWithInt:4]];
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
