//
//  OTRSettingsManager.h
//  Off the Record
//
//  Created byTopStar on 4/10/18.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.

@import Foundation;
#import "OTRSetting.h"
#import "OTRConstants.h"

@class OTRSettingsGroup;
NS_ASSUME_NONNULL_BEGIN
@interface OTRSettingsManager : NSObject

@property (nonatomic, strong, readonly) NSArray<OTRSettingsGroup*> *settingsGroups;
@property (nonatomic, strong, readonly) NSDictionary<NSString*,OTRSetting*> *settingsDictionary;

- (OTRSetting*) settingAtIndexPath:(NSIndexPath*)indexPath;
- (NSString*) stringForGroupInSection:(NSUInteger)section;
- (NSUInteger) numberOfSettingsInSection:(NSUInteger)section;
- (nullable OTRSetting*) settingForOTRSettingKey:(NSString*)key;

- (nullable NSIndexPath *)indexPathForSetting:(OTRSetting *)setting;

+ (BOOL) boolForOTRSettingKey:(NSString*)key;
+ (double) doubleForOTRSettingKey:(NSString*)key;
+ (NSInteger) intForOTRSettingKey:(NSString *)key;
+ (float) floatForOTRSettingKey:(NSString *)key;

/** Recalculates current setting list */
- (void) populateSettings;

/** If enabled, will show UI for enabling OMEMO group encryption. */
@property (nonatomic, class, readonly) BOOL allowGroupOMEMO;

@end
NS_ASSUME_NONNULL_END
