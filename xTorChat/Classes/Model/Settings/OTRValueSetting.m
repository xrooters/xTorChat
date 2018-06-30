//
//  OTRValueSetting.m
//  Off the Record
//
//  Created byTopStar on 4/11/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


#import "OTRValueSetting.h"
#import "OTRConstants.h"

@implementation OTRValueSetting
@synthesize key, defaultValue;

- (void) dealloc
{
    key = nil;
}

- (id) initWithTitle:(NSString*)newTitle description:(NSString*)newDescription settingsKey:(NSString*)newSettingsKey;
{
    if (self = [super initWithTitle:newTitle description:newDescription])
    {
        key = newSettingsKey;
    }
    return self;
}

- (id) value
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}

- (void) setValue:(id)settingsValue
{
    if (!key || !settingsValue) {
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:settingsValue forKey:key];
    [defaults synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:kOTRSettingsValueUpdatedNotification object:key userInfo:@{key: settingsValue}];
}





@end
