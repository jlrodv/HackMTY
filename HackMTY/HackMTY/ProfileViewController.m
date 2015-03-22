//
//  ProfileViewController.m
//  HackMTY
//
//  Created by Abner Castro Aguilar on 22/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
{
    NSArray *optionsArray;
}

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Your Profile";
    self.textFieldUsername.delegate = self;
    
    optionsArray = [NSArray arrayWithObjects:@"Connect with Dropbox", @"Connect with Google Drive", @"Connect with OneDrive", @"Share the App", nil];
    self.tableProfile.delegate = self;
    self.tableProfile.dataSource = self;
}

#pragma mark Texfield Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [optionsArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Options";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [optionsArray objectAtIndex:indexPath.row];
    return cell;
}


- (IBAction)selectProfilePicture:(UITapGestureRecognizer *)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"Select a profile Image" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *library = [UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:camera];
    [alert addAction:library];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}
@end


















































































































































































































