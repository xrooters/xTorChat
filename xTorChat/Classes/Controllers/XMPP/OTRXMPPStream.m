//
//  OTRXMPPStream.m
//  xTorChat
//
//  Created byTopStar on 2/3/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

#import "OTRXMPPStream.h"

@interface XMPPStream(Overrides)
- (BOOL)connectToHost:(NSString *)host onPort:(UInt16)port withTimeout:(NSTimeInterval)timeout error:(NSError **)errPtr;
@end

@implementation OTRXMPPStream

/** Override */
- (BOOL)connectToHost:(NSString *)host onPort:(UInt16)port withTimeout:(NSTimeInterval)timeout error:(NSError **)errPtr
{
    _connectedHostName = [host copy];
    return [super connectToHost:host onPort:port withTimeout:timeout error:errPtr];
}

@end
