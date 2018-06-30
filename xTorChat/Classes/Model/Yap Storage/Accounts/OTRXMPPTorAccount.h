//
//  OTRXMPPTorAccount.h
//  Off the Record
//
//  Created by David Chiles on 3/28/14.
//  Copyright (c) 2014TopStar. All rights reserved.
//

#import "OTRXMPPAccount.h"

@interface OTRXMPPTorAccount : OTRXMPPAccount

/** If a server has a .onion address it will be preferred */
@property (nonatomic, strong) NSString *onion;

@end
