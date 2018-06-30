//
//  UITableView+xTorChat.h
//  xTorChat
//
//  Created byTopStar on 4/24/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

@import UIKit;
@import YapDatabase;
#import "OTRThreadOwner.h"

NS_ASSUME_NONNULL_BEGIN
@interface UITableView (xTorChat)

/** deleteActionAlsoRemovesFromRoster is YES for the ChooseBuddy view, otherwise NO. Connection must be read-write */
+ (nullable NSArray<UITableViewRowAction *> *)editActionsForThread:(id<OTRThreadOwner>)thread deleteActionAlsoRemovesFromRoster:(BOOL)deleteActionAlsoRemovesFromRoster connection:(YapDatabaseConnection*)connection;

@end
NS_ASSUME_NONNULL_END
