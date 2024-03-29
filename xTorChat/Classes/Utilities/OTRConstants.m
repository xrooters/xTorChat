//
//  OTRConstants.h
//  Off the Record
//
//  Created by David Chiles on 6/28/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//

#import "OTRConstants.h"

NSString *const kOTRIgnoreDonationDateKey = @"kOTRIgnoreDonationDateKey";
NSString *const kOTRProtocolLoginSuccess                   = @"LoginSuccessNotification";

NSString *const kOTRProtocolTypeXMPP = @"xmpp";
NSString *const kOTRProtocolTypeAIM  = @"prpl-oscar";

NSString *const kOTRNotificationAccountNameKey       = @"kOTRNotificationAccountNameKey";
NSString *const kOTRNotificationUserNameKey          = @"kOTRNotificationUserNameKey";
NSString *const kOTRNotificationProtocolKey          = @"kOTRNotificationProtocolKey";
NSString *const kOTRNotificationBuddyUniqueIdKey     = @"kOTRNotificationBuddyUniqueIdKey";
NSString *const kOTRNotificationAccountUniqueIdKey   = @"kOTRNotificationAccountUniqueIdKey";
NSString *const kOTRNotificationAccountCollectionKey = @"kOTRNotificationAccountCollectionKey";


NSString *const kOTRServiceName            = @"org.chatsecure.ChatSecure";
NSString *const kOTRCertificateServiceName = @"org.chatsecure.ChatSecure.Certificate";

NSString *const kOTRSettingKeyFontSize                 = @"kOTRSettingKeyFontSize";
NSString *const kOTRSettingKeyDeleteOnDisconnect       = @"kOTRSettingKeyDeleteOnDisconnect";
NSString *const kOTRSettingKeyAllowDBPassphraseBackup  = @"kOTRSettingKeyAllowDBPassphraseBackup";
NSString *const kOTRSettingKeyShowDisconnectionWarning = @"kOTRSettingKeyShowDisconnectionWarning";
NSString *const kOTRSettingUserAgreedToEULA            = @"kOTRSettingUserAgreedToEULA";
NSString *const kOTRSettingAccountsKey                 = @"kOTRSettingAccountsKey";
NSString *const kOTRSettingsValueUpdatedNotification = @"kOTRSettingsValueUpdatedNotification";

NSString *const kOTRPushEnabledKey = @"kOTRPushEnabledKey";

NSString *const kOTRAppVersionKey     = @"kOTRAppVersionKey";

NSString *const OTRArchiverKey = @"OTRArchiverKey";

NSString *const kOTRErrorDomain = @"com.chatsecure";


NSString *const OTRUserNotificationsUNTextInputReply = @"OTRUserNotificationsUNTextInputReply";
NSString *const OTRUserNotificationsChanged = @"OTRUserNotificationsChanged";
NSString *const OTRPushAccountDeviceChanged = @"OTRPushAccountDeviceChanged";
NSString *const OTRPushAccountTokensChanged = @"OTRPushAccountTokensChanged";


NSString *const OTRSuccessfulRemoteNotificationRegistration = @"OTRSuccessfulRemoteNotificationRegistration";

NSString *const OTRYapDatabasePassphraseAccountName = @"OTRYapDatabasePassphraseAccountName";

NSString *const OTRYapDatabaseName = @"ChatSecureYap.sqlite";

//Noticications
NSString *const kOTRNotificationAccountKey = @"kOTRNotificationAccountKey";
NSString *const kOTRNotificationThreadKey = @"kOTRNotificationThreadKey";
NSString *const kOTRNotificationThreadCollection = @"kOTRNotificationThreadCollection";
NSString *const kOTRNotificationType = @"kOTRNotificationType";
NSString *const kOTRNotificationTypeNone = @"kOTRNotificationTypeNone";
NSString *const kOTRNotificationTypeSubscriptionRequest = @"kOTRNotificationTypeSubscriptionRequest";
NSString *const kOTRNotificationTypeApprovedBuddy = @"kOTRNotificationTypeApprovedBuddy";
NSString *const kOTRNotificationTypeConnectionError = @"kOTRNotificationTypeConnectionError";
NSString *const kOTRNotificationTypeChatMessage = @"kOTRNotificationTypeChatMessage";


//NSUserDefaults
NSString *const kOTRDeletedFacebookKey = @"kOTRDeletedFacebookKey";
NSString *const kOTRShowOMEMOGroupEncryptionKey = @"kOTRShowOMEMOGroupEncryptionKey";
NSString *const kOTREnableDebugLoggingKey = @"kOTREnableDebugLoggingKey";

extern NSString *const kOTREnableDebugLoggingKey;
//Chatview
CGFloat const kOTRSentDateFontSize            = 13;
CGFloat const kOTRDeliveredFontSize           = 13;
CGFloat const kOTRMessageFontSize             = 16;
CGFloat const kOTRMessageSentDateLabelHeight  = kOTRSentDateFontSize + 7;
CGFloat const kOTRMessageDeliveredLabelHeight = kOTRDeliveredFontSize + 7;

NSUInteger const kOTRMinimumPassphraseLength = 8;
NSUInteger const kOTRMaximumPassphraseLength = 64;
