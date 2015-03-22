//
//  AddHomeworkViewController.m
//  HackMTY
//
//  Created by Abner Castro Aguilar on 22/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import "AddHomeworkViewController.h"

@interface AddHomeworkViewController ()

@end

@implementation AddHomeworkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneView)];
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelView)];
    self.navigationItem.rightBarButtonItem = done;
    self.navigationItem.leftBarButtonItem = cancel;
    self.navigationItem.title = @"Add your homework";
    
}

- (void)doneView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancelView{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
