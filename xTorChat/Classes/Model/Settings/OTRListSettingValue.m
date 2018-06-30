//
//  OTRListSettingValue.m
//  xTorChat
//
//  Created by David Chiles on 11/10/14.
//  Copyright (c) 2014TopStar. All rights reserved.
//

#import "OTRListSettingValue.h"

@implementation OTRListSettingValue

- (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail value:(id)value
{
    if (self = [self init]) {
        _title = title;
        _detail = detail;
        _value = value;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ (%@) - %@",self.title,self.detail,self.value];
}

@end
