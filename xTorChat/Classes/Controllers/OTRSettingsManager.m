//
//  OTRSettingsManager.m
//  Off the Record
//
//  Created byTopStar on 4/10/18.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.

#import "OTRSettingsManager.h"
#import "OTRViewSetting.h"
@import OTRAssets;
#import "OTRSetting.h"
#import "OTRBoolSetting.h"
#import "OTRViewSetting.h"
#import "OTRDoubleSetting.h"
#import "OTRFeedbackSetting.h"
#import "OTRConstants.h"
#import "OTRShareSetting.h"
#import "OTRSettingsGroup.h"
#import "OTRLanguageSetting.h"
#import "OTRDonateSetting.h"
#import "OTRIntSetting.h"
#import "OTRCertificateSetting.h"
#import "OTRUtilities.h"
#import <xTorChatCore/xTorChatCore-Swift.h>

#import "OTRUtilities.h"

@interface OTRSettingsManager ()
@end

@implementation OTRSettingsManager

- (instancetype) init
{
    if (self = [super init])
    {
        [self populateSettings];
    }
    return self;
}

- (void) populateSettings
{
    NSMutableArray<OTRSettingsGroup*> *settingsGroups = [NSMutableArray array];
    NSMutableDictionary *newSettingsDictionary = [NSMutableDictionary dictionary];
    // Leave this in for now
    OTRViewSetting *accountsViewSetting = [[OTRViewSetting alloc] initWithTitle:ACCOUNTS_STRING() description:nil viewControllerClass:nil];
    OTRSettingsGroup *accountsGroup = [[OTRSettingsGroup alloc] initWithTitle:ACCOUNTS_STRING() settings:@[accountsViewSetting]];
    [settingsGroups addObject:accountsGroup];
    
    if (OTRBranding.allowsDonation) {
        NSString *donateTitle = DONATE_STRING();
        if (TransactionObserver.hasValidReceipt) {
            donateTitle = [NSString stringWithFormat:@"%@    ✅", DONATE_STRING()];
        } else {
            donateTitle = [NSString stringWithFormat:@"%@    🆕", DONATE_STRING()];
        }
        OTRDonateSetting *donateSetting = [[OTRDonateSetting alloc] initWithTitle:donateTitle description:nil];
        //donateSetting.imageName = @"29-heart.png";
        OTRSetting *moreSetting = [[OTRSetting alloc] initWithTitle:MORE_WAYS_TO_HELP_STRING() description:nil];
        moreSetting.actionBlock = ^void(id sender) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Purchase" bundle:[OTRAssets resourcesBundle]];
            UIViewController *moreVC = [storyboard instantiateViewControllerWithIdentifier:@"moreWaysToHelp"];
            UIViewController *sourceVC = sender;
            if (![sender isKindOfClass:[UIViewController class]]) {
                return;
            }
            [sourceVC presentViewController:moreVC animated:YES completion:nil];
        };
        OTRSettingsGroup *donateGroup = [[OTRSettingsGroup alloc] initWithTitle:DONATE_STRING() settings:@[donateSetting, moreSetting]];
        [settingsGroups addObject:donateGroup];
    }
    
    OTRBoolSetting *deletedDisconnectedConversations = [[OTRBoolSetting alloc] initWithTitle:DELETE_CONVERSATIONS_ON_DISCONNECT_TITLE_STRING()
                                                                                 description:DELETE_CONVERSATIONS_ON_DISCONNECT_DESCRIPTION_STRING()
                                                                                 settingsKey:kOTRSettingKeyDeleteOnDisconnect];
    
    [newSettingsDictionary setObject:deletedDisconnectedConversations forKey:kOTRSettingKeyDeleteOnDisconnect];
    
    OTRCertificateSetting * certSetting = [[OTRCertificateSetting alloc] initWithTitle:PINNED_CERTIFICATES_STRING()
                                                                           description:PINNED_CERTIFICATES_DESCRIPTION_STRING()];
    
    certSetting.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    OTRBoolSetting *backupKeySetting = [[OTRBoolSetting alloc] initWithTitle:ALLOW_DB_PASSPHRASE_BACKUP_TITLE_STRING()
                                                                 description:ALLOW_DB_PASSPHRASE_BACKUP_DESCRIPTION_STRING()
                                                                 settingsKey:kOTRSettingKeyAllowDBPassphraseBackup];

    if (![PushController canReceivePushNotifications] ||
        [PushController getPushPreference] != PushPreferenceEnabled) {
        OTRViewSetting *pushViewSetting = [[OTRViewSetting alloc] initWithTitle:XTORCHAT_PUSH_STRING() description:nil viewControllerClass:[EnablePushViewController class]];
        pushViewSetting.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        OTRSettingsGroup *pushGroup = [[OTRSettingsGroup alloc] initWithTitle:PUSH_TITLE_STRING() settings:@[pushViewSetting]];
        [settingsGroups addObject:pushGroup];
    }

    
    NSArray *chatSettings = @[deletedDisconnectedConversations];
    OTRSettingsGroup *chatSettingsGroup = [[OTRSettingsGroup alloc] initWithTitle:CHAT_STRING() settings:chatSettings];
    [settingsGroups addObject:chatSettingsGroup];
    
    NSArray * securitySettings = @[certSetting, backupKeySetting];
    OTRSettingsGroup *securitySettingsGroup = [[OTRSettingsGroup alloc] initWithTitle:SECURITY_STRING() settings:securitySettings];
    [settingsGroups addObject:securitySettingsGroup];
    
    OTRShareSetting * shareViewSetting = [[OTRShareSetting alloc] initWithTitle:SHARE_STRING() description:nil];
    shareViewSetting.imageName = @"275-broadcast.png";
    
    OTRLanguageSetting * languageSetting = [[OTRLanguageSetting alloc]initWithTitle:LANGUAGE_STRING() description:nil settingsKey:kOTRSettingKeyLanguage];
    languageSetting.imageName = @"globe.png";
    [newSettingsDictionary setObject:languageSetting forKey:kOTRSettingKeyLanguage];
    
    NSMutableArray *otherSettings = [NSMutableArray arrayWithCapacity:5];
    [otherSettings addObjectsFromArray:@[languageSetting, shareViewSetting]];
    
    if ([OTRBranding githubURL]) {
        OTRFeedbackSetting * feedbackViewSetting = [[OTRFeedbackSetting alloc] initWithTitle:SEND_FEEDBACK_STRING() description:nil];
        feedbackViewSetting.imageName = @"18-envelope.png";
        [otherSettings addObject:feedbackViewSetting];
    }

    OTRSettingsGroup *otherGroup = [[OTRSettingsGroup alloc] initWithTitle:OTHER_STRING() settings:otherSettings];
    
    OTRSettingsGroup *advancedGroup = [[OTRSettingsGroup alloc] initWithTitle:ADVANCED_STRING()];
    
    if (OTRBranding.allowGroupOMEMO) {
        OTRBoolSetting *omemoGroupKeySetting = [[OTRBoolSetting alloc] initWithTitle:OMEMO_GROUP_ENCRYPTION_STRING()
                                                                         description:OMEMO_GROUP_ENCRYPTION_DETAIL_STRING()
                                                                         settingsKey:kOTRShowOMEMOGroupEncryptionKey];
        [advancedGroup addSetting:omemoGroupKeySetting];
    }
    
    if (OTRBranding.allowDebugFileLogging) {
        OTRViewSetting *logsSetting = [[OTRViewSetting alloc] initWithTitle:MANAGE_DEBUG_LOGS_STRING()
                                                                description:nil
                                                        viewControllerClass:[OTRLogListViewController class]];
        logsSetting.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [advancedGroup addSetting:logsSetting];
    }
    
    [settingsGroups addObject:otherGroup];
    
    if (advancedGroup.settings.count > 0) {
        [settingsGroups addObject:advancedGroup];
    }
    
    _settingsDictionary = newSettingsDictionary;
    _settingsGroups = settingsGroups;
}

- (OTRSetting*) settingAtIndexPath:(NSIndexPath*)indexPath
{
    OTRSettingsGroup *settingsGroup = [self.settingsGroups objectAtIndex:indexPath.section];
    return [settingsGroup.settings objectAtIndex:indexPath.row];
}

- (NSString*) stringForGroupInSection:(NSUInteger)section
{
    OTRSettingsGroup *settingsGroup = [self.settingsGroups objectAtIndex:section];
    return settingsGroup.title;
}

- (NSUInteger) numberOfSettingsInSection:(NSUInteger)section
{
    OTRSettingsGroup *settingsGroup = [self.settingsGroups objectAtIndex:section];
    return [settingsGroup.settings count];
}

- (nullable NSIndexPath *)indexPathForSetting:(OTRSetting *)setting
{
    __block NSIndexPath *indexPath = nil;
    [self.settingsGroups enumerateObjectsUsingBlock:^(OTRSettingsGroup *group, NSUInteger idx, BOOL *stop) {
        NSUInteger row = [group.settings indexOfObject:setting];
        if (row != NSNotFound) {
            indexPath = [NSIndexPath indexPathForItem:row inSection:idx];
            *stop = YES;
        }
    }];
    return indexPath;
}

+ (BOOL) boolForOTRSettingKey:(NSString*)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:key];
}

+ (double) doubleForOTRSettingKey:(NSString*)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults doubleForKey:key];
}

+ (NSInteger) intForOTRSettingKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults integerForKey:key];
}

+ (float) floatForOTRSettingKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults floatForKey:key];
}

- (nullable OTRSetting*) settingForOTRSettingKey:(NSString*)key {
    return [self.settingsDictionary objectForKey:key];
}

+ (BOOL) allowGroupOMEMO {
    return OTRBranding.allowGroupOMEMO && [self boolForOTRSettingKey:kOTRShowOMEMOGroupEncryptionKey];
}

@end
