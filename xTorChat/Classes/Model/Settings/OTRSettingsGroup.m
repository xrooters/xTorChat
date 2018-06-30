//
//  OTRSettingsGroup.m
//  Off the Record
//
//  Created byTopStar on 4/11/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


#import "OTRSettingsGroup.h"

NS_ASSUME_NONNULL_BEGIN

@interface OTRSettingsGroup()
@property (nonatomic, readwrite) NSMutableArray<OTRSetting*> *mutableSettings;
@end

@implementation OTRSettingsGroup

- (instancetype)init
{
    [self doesNotRecognizeSelector:_cmd];
    abort();
}

- (instancetype) initWithTitle:(NSString*)title {
    return [self initWithTitle:title settings:nil];
}

- (instancetype) initWithTitle:(NSString*)title settings:(nullable NSArray<OTRSetting*>*)settings
{
    NSParameterAssert(title);
    if (self = [super init])
    {
        _title = [title copy];
        if (settings) {
            _mutableSettings = [settings mutableCopy];
        } else {
            _mutableSettings = [NSMutableArray array];
        }
    }
    return self;
}

- (NSArray<OTRSetting*>*) settings {
    return [self.mutableSettings copy];
}

- (void) addSetting:(OTRSetting*)setting {
    NSParameterAssert(setting);
    [self.mutableSettings addObject:setting];
}

@end

NS_ASSUME_NONNULL_END
