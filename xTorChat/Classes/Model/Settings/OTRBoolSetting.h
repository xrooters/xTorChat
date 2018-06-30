//
//  OTRBoolSetting.h
//  Off the Record
//
//  Created byTopStar on 4/11/18.
//  Copyright (c) 2018 TopStar. All rights reserved.
//
//  This file is part of xTorChat.

#import "OTRValueSetting.h"

@interface OTRBoolSetting : OTRValueSetting

@property (nonatomic) BOOL enabled;

- (void) toggle;

@end
