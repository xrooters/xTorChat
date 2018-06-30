//
//  OTRMediaItem+Private.h
//  xTorChatCore
//
//  Created byTopStar on 6/14/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

#import "OTRMediaItem.h"
#import "OTRDownloadMessage.h"

@interface OTRMediaItem ()
/** Returns view to help assist in manually (re)downloading media, or nil if not needed */
- (nullable UIView*) errorView;
/** ⚠️ Do not call from within an existing database transaction */
- (nullable id<OTRDownloadMessage>) downloadMessage;
@end
