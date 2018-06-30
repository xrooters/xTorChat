//
//  NSXMLElement+XEP_0048.m
//  XMPPFramework
//
//  Created byTopStar on 11/10/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

#import "NSXMLElement+XEP_0048.h"
#import "NSXMLElement+XMPP.h"
#import "XMPPBookmarksStorageElement.h"


@implementation NSXMLElement (XEP_0048)

- (XMPPBookmarksStorageElement*) bookmarksStorageElement {
    NSXMLElement *element = [self elementForName:XMPPBookmarkConstants.storageElement xmlns:XMPPBookmarkConstants.xmlns];
    return [XMPPBookmarksStorageElement bookmarksStorageElementFromElement:element];
}
@end

@implementation XMPPBookmarkConstants
+ (NSString*) xmlns {
    return @"storage:bookmarks";
}
+ (NSString*) storageElement {
    return @"storage";
}
+ (NSString*) conferenceElement {
    return @"conference";
}
+ (NSString*) urlElement {
    return @"url";
}
+ (NSString*) urlAttribute {
    return @"url";
}
+ (NSString*) passwordElement {
    return @"password";
}
+ (NSString*) nickElement {
    return @"nick";
}
+ (NSString*) nameAttribute {
    return @"name";
}
+ (NSString*) autojoinAttribute {
    return @"autojoin";
}
+ (NSString*) jidAttribute {
    return @"jid";
}
@end
