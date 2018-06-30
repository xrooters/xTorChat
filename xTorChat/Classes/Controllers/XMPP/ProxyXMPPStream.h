//
//  ProxyXMPPStream.h
//  xTorChat
//
//  Created byTopStar on 2/2/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

#import "OTRXMPPStream.h"
@import ProxyKit;

@interface ProxyXMPPStream : OTRXMPPStream

/**
 * Sets SOCKS proxy host and port
 **/
- (void) setProxyHost:(NSString*)host port:(uint16_t)port version:(GCDAsyncSocketSOCKSVersion)version;
- (void) setProxyUsername:(NSString *)username password:(NSString*)password;

@end
