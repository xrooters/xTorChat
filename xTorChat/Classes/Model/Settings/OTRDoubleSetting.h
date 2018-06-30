//
//  OTRDoubleSetting.h
//  Off the Record
//
//  Created byTopStar on 4/24/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


#import "OTRValueSetting.h"


@interface OTRDoubleSetting : OTRValueSetting

@property (nonatomic) double doubleValue;
@property (nonatomic) double minValue;
@property (nonatomic) double maxValue;
@property (nonatomic) BOOL isPercentage;
@property (nonatomic) NSUInteger numValues;
@property (nonatomic, retain) NSNumber *defaultValue;

- (void) editValue;
- (NSString*) stringValue;

@end
