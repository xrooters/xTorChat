//
//  OTRValueSetting.h
//  Off the Record
//
//  Created byTopStar on 4/11/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


#import "OTRSetting.h"

@interface OTRValueSetting : OTRSetting

@property (nonatomic, retain, readonly) NSString *key;
@property (nonatomic, retain) id value;
@property (nonatomic, retain) id defaultValue;


- (id) initWithTitle:(NSString*)newTitle description:(NSString*)newDescription settingsKey:(NSString*)newSettingsKey;

@end
