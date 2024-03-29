//
//  YapDatabaseViewConnection+xTorChat.m
//  xTorChat
//
//  Created byTopStar on 2/24/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

#import "YapDatabaseViewConnection+xTorChat.h"

@interface OTRSectionRowChanges()
- (instancetype) initWithSectionChanges:(NSArray<YapDatabaseViewSectionChange *> *)sectionChanges rowChanges:(NSArray<YapDatabaseViewRowChange *> *) rowChanges;
@end

@implementation OTRSectionRowChanges

- (instancetype) initWithSectionChanges:(NSArray<YapDatabaseViewSectionChange *> *)sectionChanges rowChanges:(NSArray<YapDatabaseViewRowChange *> *) rowChanges {
    NSParameterAssert(sectionChanges != nil);
    NSParameterAssert(rowChanges != nil);
    if (self = [super init]) {
        _sectionChanges = sectionChanges;
        _rowChanges = rowChanges;
    }
    return self;
}

@end

@implementation YapDatabaseViewConnection (xTorChat)

- (OTRSectionRowChanges*) otr_getSectionRowChangesForNotifications:(NSArray<NSNotification*> *)notifications
                                                      withMappings:(YapDatabaseViewMappings *)mappings {
    NSParameterAssert(notifications != nil);
    NSParameterAssert(mappings != nil);
    NSArray *sc = nil;
    NSArray *rc = nil;
    [self getSectionChanges:&sc rowChanges:&rc forNotifications:notifications withMappings:mappings];
    if (!sc) {
        sc = @[];
    }
    if (!rc) {
        rc = @[];
    }
    OTRSectionRowChanges *src = [[OTRSectionRowChanges alloc] initWithSectionChanges:sc rowChanges:rc];
    return src;
}

@end
