//
//  OTRTextItem.m
//  xTorChat
//
//  Created byTopStar on 5/25/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

#import "OTRTextItem.h"
#import "OTRMediaItem+Private.h"

@implementation OTRTextItem

// Return empty view for now
- (UIView *)mediaView {
    UIView *errorView = [self errorView];
    if (errorView) { return errorView; }
    CGSize size = [self mediaViewDisplaySize];
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    return [[UIView alloc] initWithFrame:frame];
}

+ (NSString *)collection
{
    return [OTRMediaItem collection];
}

@end
