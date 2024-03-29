//
//  NSXMLElement+XEP_0359.m
//  XMPPFramework
//
//  Created byTopStar on 10/10/18.
//  Copyright © 2018 robbiehanson. All rights reserved.
//

#import "NSXMLElement+XEP_0359.h"
#import "NSXMLElement+XMPP.h"

NSString *const XMPPStanzaIdXmlns = @"urn:xmpp:sid:0";
NSString *const XMPPStanzaIdElementName = @"stanza-id";
NSString *const XMPPOriginIdElementName = @"origin-id";

@implementation NSXMLElement (XEP_0359)

+ (instancetype) originIdElement {
    return [self originIdElementWithUniqueId:nil];
}

+ (instancetype) originIdElementWithUniqueId:(nullable NSString*)uniqueId {
    if (!uniqueId) {
        uniqueId = [NSUUID UUID].UUIDString;
    }
    NSXMLElement *element = [NSXMLElement elementWithName:XMPPOriginIdElementName xmlns:XMPPStanzaIdXmlns];
    [element addAttributeWithName:@"id" objectValue:uniqueId];
    
    return element;
}

@end
