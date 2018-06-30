//
//  XMPPMessage+XEP_0313.m
//  XMPPFramework
//
//  Created byTopStar on 10/23/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

#import "XMPPMessage+XEP_0313.h"
#import "XMPPMessageArchiveManagement.h"
#import "NSXMLElement+XMPP.h"

@implementation XMPPMessage (XEP_0313)

- (NSXMLElement*) mamResult {
    NSXMLElement *result = [self elementForName:@"result" xmlns:XMLNS_XMPP_MAM];
    return result;
}

@end
