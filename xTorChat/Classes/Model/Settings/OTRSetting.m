//
//  OTRSetting.m
//  Off the Record
//
//  Created byTopStar on 4/11/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


#import "OTRSetting.h"

@implementation OTRSetting

- (id) initWithTitle:(NSString*)newTitle description:(NSString*)newDescription
{
    if (self = [super init])
    {
        _title = newTitle;
        _settingDescription = newDescription;
    }
    return self;
}

@end
