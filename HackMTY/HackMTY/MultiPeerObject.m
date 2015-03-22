//
//  MultiPeerObject.m
//  HackMTY
//
//  Created by Jose Luis Rodriguez on 22/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//
#define SEPARATOR @"/00FF0/"
#import "MultiPeerObject.h"
#import <MultipeerConnectivity/MultipeerConnectivity.h>
#import <Parse/Parse.h>

@interface MultiPeerObject()<MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate, MCSessionDelegate>

@property (nonatomic, strong) MCNearbyServiceAdvertiser *advertiser;
@property (nonatomic, strong) MCPeerID *peerId;
@property (nonatomic, strong) MCNearbyServiceBrowser *browser;
@end

@implementation MultiPeerObject

+(id)sharedManager{
    
    static MultiPeerObject *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
    
}

-(id)init{
    
    if (self = [super init]) {
        
        
        self.peerId = [[MCPeerID alloc] initWithDisplayName:[NSString stringWithFormat:@"%@%@%@",[PFUser currentUser].email,SEPARATOR,[[PFUser currentUser] valueForKey:@"user"] ] ];
        self.advertiser = [[MCNearbyServiceAdvertiser alloc]initWithPeer:self.peerId discoveryInfo:nil serviceType:@"hckmty-txtchat"];
        self.advertiser.delegate = self;
        [self.advertiser startAdvertisingPeer];
        
        self.browser = [[MCNearbyServiceBrowser alloc]initWithPeer:self.peerId serviceType:@"hckmty-txtchat"];
        self.browser.delegate = self;
        [self.browser startBrowsingForPeers];
        
        self.session = [[MCSession alloc] initWithPeer:self.peerId];
        self.session.delegate=self;
        
        
        
    }
    return self;
    
}

-(void)browser:(MCNearbyServiceBrowser *)browser foundPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary *)info{


}

-(void)browser:(MCNearbyServiceBrowser *)browser lostPeer:(MCPeerID *)peerID{


}

-(void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didReceiveInvitationFromPeer:(MCPeerID *)peerID withContext:(NSData *)context invitationHandler:(void (^)(BOOL, MCSession *))invitationHandler{



}

-(void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state{


}

-(void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID{


}

-(void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error{


}

@end
