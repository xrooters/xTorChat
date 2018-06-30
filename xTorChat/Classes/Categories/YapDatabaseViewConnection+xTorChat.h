//
//  YapDatabaseViewConnection+xTorChat.h
//  xTorChat
//
//  Created byTopStar on 2/24/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

@import YapDatabase;

NS_ASSUME_NONNULL_BEGIN
@interface OTRSectionRowChanges : NSObject
@property (nonatomic, strong, readonly) NSArray<YapDatabaseViewSectionChange *> *sectionChanges;
@property (nonatomic, strong, readonly) NSArray<YapDatabaseViewRowChange *> *rowChanges;
@end

@interface YapDatabaseViewConnection (xTorChat)

- (OTRSectionRowChanges*) otr_getSectionRowChangesForNotifications:(NSArray<NSNotification*> *)notifications
                                                      withMappings:(YapDatabaseViewMappings *)mappings;
@end
NS_ASSUME_NONNULL_END
