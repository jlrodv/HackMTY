//
//  HomeworkViewController.m
//  HackMTY
//
//  Created by Abner Castro Aguilar on 21/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import "HomeworkViewController.h"
#import <Parse/Parse.h>
#import "HomeworkCell.h"
#import "TaskDetailViewController.h"

@interface HomeworkViewController ()
{
    NSMutableArray *queryArray;
    NSMutableArray *dueDates;
    
}

@end

@implementation HomeworkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableHomework.delegate = self;
    self.tableHomework.dataSource = self;
    
    dueDates = [[NSMutableArray alloc]init];
    queryArray = [[NSMutableArray alloc] init];
    [self downloadFromParse:self.buttonSwitch.selectedSegmentIndex];
}

- (void)downloadFromParse:(NSInteger)segmentedIndex
{
    [dueDates removeAllObjects];
    [queryArray removeAllObjects];
    PFQuery *query = [PFQuery queryWithClassName:@"Task"];
    switch(segmentedIndex)
    {
        case 0:
        {
            [query whereKey:@"Completed" equalTo:[NSNumber numberWithBool:NO]];
        }
        break;
        case 1:
        {
            [query whereKey:@"Completed" equalTo:[NSNumber numberWithBool:YES]];
        }
        break;
        default:
            break;
    }
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            [queryArray addObjectsFromArray:objects];
            
            for (PFObject *object in queryArray) {
                [dueDates addObject:[object objectForKey:@"DueDate"]];
            }
            [self.tableHomework reloadData];
        }
    }];
}

#pragma mark Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [queryArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeworkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeworkCell" forIndexPath:indexPath];
    PFObject *object = [queryArray objectAtIndex:indexPath.row];
    cell.labelTitle.text = [object objectForKey:@"Title"];
    cell.labelDescription.text = [object objectForKey:@"Description"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TaskDetailViewController *taskDetail = [[self storyboard] instantiateViewControllerWithIdentifier:@"taskDetail"];
    taskDetail.taskDetail = [queryArray objectAtIndex:indexPath.row];
    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:taskDetail];
    [self presentViewController:nv animated:YES completion:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /*PFObject *object = [queryArray objectAtIndex:indexPath.row];
    PFObject *saver = [PFObject objectWithoutDataWithClassName:@"Task" objectId:[object objectId]];
    
    switch(self.buttonSwitch.selectedSegmentIndex)
    {
        case 0:
        {
            UIAlertController *sheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction *markAction = [UIAlertAction actionWithTitle:@"Mark As Completed" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [saver setObject:[NSNumber numberWithBool:YES] forKey:@"Completed"];
                [saver save];
                [queryArray removeObjectAtIndex:indexPath.row];
                [tableView reloadData];
                [tableView deselectRowAtIndexPath:indexPath animated:YES];
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                [tableView deselectRowAtIndexPath:indexPath animated:YES];
            }];
            [sheet addAction:markAction];
            [sheet addAction:cancelAction];
            [self presentViewController:sheet animated:YES completion:nil];
        }
        break;
        case 1:
        {
            UIAlertController *sheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction *markAction = [UIAlertAction actionWithTitle:@"Mark As Current" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [saver setObject:[NSNumber numberWithBool:NO] forKey:@"Completed"];
                [saver save];
                [queryArray removeObjectAtIndex:indexPath.row];
                [tableView reloadData];
                [tableView deselectRowAtIndexPath:indexPath animated:YES];
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                [tableView deselectRowAtIndexPath:indexPath animated:YES];
            }];
            [sheet addAction:markAction];
            [sheet addAction:cancelAction];
            [self presentViewController:sheet animated:YES completion:nil];
        }
        break;
        default:
            break;
    }*/
}



- (IBAction)switchHomewroks:(UISegmentedControl *)sender
{
    [self downloadFromParse:sender.selectedSegmentIndex];
}
@end















































































































