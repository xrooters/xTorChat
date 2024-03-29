//
//  OTRSignalObject.h
//  xTorChat
//
//  Created by David Chiles on 7/26/16.
//  Copyright © 2016TopStar. All rights reserved.
//

#import "OTRYapDatabaseObject.h"
@import YapDatabase;

NS_ASSUME_NONNULL_BEGIN

@interface OTRSignalObject : OTRYapDatabaseObject <YapDatabaseRelationshipNode>

@property (nonnull, strong) NSString *accountKey;

@end

NS_ASSUME_NONNULL_END
