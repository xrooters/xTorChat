//
//  OTRBoolSetting.m
//  Off the Record
//
//  Created byTopStar on 4/11/18.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.

#import "OTRBoolSetting.h"

@implementation OTRBoolSetting

- (id) initWithTitle:(NSString *)newTitle description:(NSString *)newDescription settingsKey:(NSString *)newSettingsKey
{
    if (self = [super initWithTitle:newTitle description:newDescription settingsKey:newSettingsKey])
    {
        __weak typeof (self) weakSelf = self;
        self.actionBlock = ^void(id sender) {
            [weakSelf toggle];
        };
        self.defaultValue = [NSNumber numberWithBool:NO];
    }
    return self;
}

- (void) toggle 
{
    [self setEnabled:![self enabled]];
}

- (void) setEnabled:(BOOL)enabled
{
    [self setValue:[NSNumber numberWithBool:enabled]];
    [self.delegate refreshView];
}

- (BOOL) enabled
{
    if (![self value]) 
    {
        self.value = self.defaultValue;
    }
    return [[self value] boolValue];
}

@end
