//
//  OTRAccountsManager.h
//  Off the Record
//
//  Copyright (c) 2018 TopStar. All rights reserved.
//
//  This file is part of xTorChat.

@import Foundation;
#import "OTRConstants.h"

@class OTRAccount;

NS_ASSUME_NONNULL_BEGIN
@interface OTRAccountsManager : NSObject

+ (void)removeAccount:(OTRAccount*)account;
+ (NSArray<OTRAccount*> *)allAccounts;
+ (nullable OTRAccount *)accountWithUsername:(NSString *)username;

+ (NSArray<OTRAccount*> *)allAutoLoginAccounts;


@end
NS_ASSUME_NONNULL_END
