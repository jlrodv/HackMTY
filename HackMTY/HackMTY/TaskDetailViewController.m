//
//  TaskDetailViewController.m
//  HackMTY
//
//  Created by Abner Castro Aguilar on 22/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import "TaskDetailViewController.h"

@interface TaskDetailViewController ()

@end

@implementation TaskDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissView)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    NSLog(@"task detail: %@", self.taskDetail);
    self.labelTitle.text = [self.taskDetail objectForKey:@"Title"];
    self.textDescription.text = [self.taskDetail objectForKey:@"Description"];
    
    NSString *dateString = [NSDateFormatter localizedStringFromDate:[self.taskDetail objectForKey:@"DueDate"] dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle];
    self.textDescription.text = [self.textDescription.text stringByAppendingString:[NSString stringWithFormat:@".\nDue Date: %@", dateString]];
}

- (void)dismissView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)shareFolder:(UIButton *)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"Add to shared folder" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *dropboxAction = [UIAlertAction actionWithTitle:@"Dropbox" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UIAlertController *alertSucess = [UIAlertController alertControllerWithTitle:@"Success!" message:@"Your file has been uploaded. You can share it with your contacts by copying this link: www.dropbox.com/MySharedFolder/file.pdf" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *laterAction = [UIAlertAction actionWithTitle:@"Later" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *copyAction = [UIAlertAction actionWithTitle:@"Copy" style:UIAlertActionStyleCancel handler:nil];
        [alertSucess addAction:laterAction];
        [alertSucess addAction:copyAction];
        [self presentViewController:alertSucess animated:YES completion:nil];
    }];
    UIAlertAction *driveAction = [UIAlertAction actionWithTitle:@"Google Drive" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UIAlertController *alertSucess = [UIAlertController alertControllerWithTitle:@"Success!" message:@"Your file has been uploaded. You can share it with your contacts by copying this link: www.drive.com/MySharedFolder/file.pdf" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *laterAction = [UIAlertAction actionWithTitle:@"Later" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *copyAction = [UIAlertAction actionWithTitle:@"Copy" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:laterAction];
        [alert addAction:copyAction];
        [self presentViewController:alertSucess animated:YES completion:nil];
    }];
    UIAlertAction *oneDriveAction = [UIAlertAction actionWithTitle:@"OneDrive" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UIAlertController *alertSucess = [UIAlertController alertControllerWithTitle:@"Success!" message:@"Your file has been uploaded. You can share it with your contacts by copying this link: www.onedrive.com/MySharedFolder/file.pdf" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *laterAction = [UIAlertAction actionWithTitle:@"Later" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *copyAction = [UIAlertAction actionWithTitle:@"Copy" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:laterAction];
        [alert addAction:copyAction];
        [self presentViewController:alertSucess animated:YES completion:nil];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:dropboxAction];
    [alert addAction:driveAction];
    [alert addAction:oneDriveAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}


@end




































































































































































































































