//
//  MultiPeerObject.h
//  HackMTY
//
//  Created by Jose Luis Rodriguez on 22/03/15.
//  Copyright (c) 2015 jlrodv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface MultiPeerObject : NSObject

@property (nonatomic, strong) MCSession *session;

+(id)sharedManager;

@end
