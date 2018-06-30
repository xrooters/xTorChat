//
//  OTRAccountsManager.m
//  Off the Record
//
//  Created byTopStar on 6/26/18.
//  Copyright (c) 2018 TopStar. All rights reserved.
//
//  This file is part of xTorChat.

#import "OTRAccountsManager.h"
#import "OTRSettingsManager.h"
#import "OTRConstants.h"
#import "OTRProtocolManager.h"
#import "OTRDatabaseManager.h"
@import YapDatabase;

#import "OTRLog.h"
#import "OTRAccount.h"

@implementation OTRAccountsManager

+ (void)removeAccount:(OTRAccount*)account
{
    NSParameterAssert(account);
    if (!account) { return; }
    [account removeKeychainPassword:nil];
    [[OTRDatabaseManager sharedInstance].writeConnection readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
        [transaction removeObjectForKey:account.uniqueId inCollection:[OTRAccount collection]];
    }];
}

+ (NSArray<OTRAccount*> *)allAccounts  {
    
    __block NSArray *accounts = @[];
    [[OTRDatabaseManager sharedInstance].readConnection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        accounts = [OTRAccount allAccountsWithTransaction:transaction];
    }];
    return accounts;
}

+ (OTRAccount *)accountWithUsername:(NSString *)username
{
    __block OTRAccount *account = nil;
    [[OTRDatabaseManager sharedInstance].readConnection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        account = [[OTRAccount allAccountsWithUsername:username transaction:transaction] firstObject];
    }];
    return account;
}

+ (NSArray *)allAutoLoginAccounts
{
    __block NSArray *accounts = nil;
    [[OTRDatabaseManager sharedInstance].readConnection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        accounts = [OTRAccount allAccountsWithTransaction:transaction];
    }];

    
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([evaluatedObject isKindOfClass:[OTRAccount class]]) {
            OTRAccount *account = (OTRAccount *)evaluatedObject;
            if (account.accountType != OTRAccountTypeXMPPTor && account.autologin) {
                return YES;
            }
            
        }
        return NO;
    }];
    
    return [accounts filteredArrayUsingPredicate:predicate];
}



@end
