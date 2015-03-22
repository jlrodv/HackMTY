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

@interface HomeworkViewController ()
{
    NSArray *queryArray;
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
    [self downloadFromParse:self.buttonSwitch.selectedSegmentIndex];
}

- (void)downloadFromParse:(NSInteger)segmentedIndex
{
    [dueDates removeAllObjects];
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
            queryArray = objects;
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



- (IBAction)switchHomewroks:(UISegmentedControl *)sender
{
    [self downloadFromParse:sender.selectedSegmentIndex];
}
@end















































































































