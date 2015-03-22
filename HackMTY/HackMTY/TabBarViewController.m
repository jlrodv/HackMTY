//
//  TabBarViewController.m
//  HackMTY
//
//  Created by Jose Luis Rodriguez on 22/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import "TabBarViewController.h"
#import "MultiPeerObject.h"

@interface TabBarViewController ()
@property (nonatomic, strong) MultiPeerObject *mPeer;
@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mPeer = [MultiPeerObject sharedManager];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(invitationReceived:) name:@"invitation" object:nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)invitationReceived:(NSNotification *)notification{
    
    NSLog(@"invited %@", [[notification valueForKey:@"userInfo"] objectForKey:@"peer"]);

    
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
