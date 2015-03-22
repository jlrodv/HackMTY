//
//  NearViewController.m
//  HackMTY
//
//  Created by Jose Luis Rodriguez on 22/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import "NearViewController.h"
#import "MultiPeerObject.h"

@interface NearViewController ()
@property (nonatomic, strong) NSMutableArray *accepted;
@property (nonatomic, strong) NSMutableArray *found;
@end

@implementation NearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self registerNotifications];
    
    self.found = [[NSMutableArray alloc] init];
    self.accepted =[[NSMutableArray alloc] init];
}

-(void)registerNotifications{

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newPeerFound:) name:@"foundPeer" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(peerLost:) name:@"lostPeer" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptedInvitation:) name:@"accepted" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.found.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"peer"];

    cell.textLabel.text = [[self.found objectAtIndex:indexPath.row] valueForKey:@"peer"];
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[MultiPeerObject sharedManager] sendRequestToPeer:[self.found objectAtIndex:indexPath.row]];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)newPeerFound:(NSNotification *)userInfo{
    [self.found addObject:[[userInfo valueForKey:@"userInfo"] objectForKey:@"peer"]];
    [self.tableView reloadData];
}

-(void)peerLost:(NSNotification *)userInfo{
    
    MCPeerID *lostPeer = [[userInfo valueForKey:@"userInfo"] valueForKey:@"peer"];
    for(MCPeerID *peer in self.found){
    
        if([peer.displayName isEqualToString:lostPeer.displayName] ){
        
            [self.found removeObject:lostPeer];
            break;
        
        }
    
    }
    
    [self.tableView reloadData];

}

-(void)acceptedInvitation:(NSNotification *)userInfo{

    [self.accepted addObject:[[userInfo valueForKey:@"userInfo"] objectForKey:@"peer"]];
    [self.tableView reloadData];
}

- (IBAction)close:(UIBarButtonItem *)sender {
    
}

@end
