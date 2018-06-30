//
//  OTRSettingsGroup.h
//  Off the Record
//
//  Created byTopStar on 4/11/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//



@import Foundation;

@class OTRSetting;

NS_ASSUME_NONNULL_BEGIN
@interface OTRSettingsGroup : NSObject

@property (nonatomic, readonly) NSArray<OTRSetting*> *settings;
@property (nonatomic, readonly) NSString *title;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (instancetype) initWithTitle:(NSString*)title;
- (instancetype) initWithTitle:(NSString*)title settings:(nullable NSArray<OTRSetting*>*)settings NS_DESIGNATED_INITIALIZER;

- (void) addSetting:(OTRSetting*)setting;

@end
NS_ASSUME_NONNULL_END
