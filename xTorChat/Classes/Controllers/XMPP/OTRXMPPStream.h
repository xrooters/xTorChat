//
//  OTRXMPPStream.h
//  xTorChat
//
//  Created byTopStar on 2/3/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

@import Foundation;
@import XMPPFramework;

@interface OTRXMPPStream : XMPPStream

/**
 * The connected servers hostname. The last attempted hostname before the socket actually connects to an IP address (e.g. after SRV lookup)
 **/
@property (nonatomic, readonly, nullable) NSString *connectedHostName;

@end
