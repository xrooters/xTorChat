//
//  OTRIncomingMessage.h
//  xTorChat
//
//  Created by David Chiles on 11/10/16.
//  Copyright © 2016TopStar. All rights reserved.
//

#import "OTRBaseMessage.h"

@interface OTRIncomingMessage : OTRBaseMessage <OTRMessageProtocol>

@property (nonatomic) BOOL read;

@end
