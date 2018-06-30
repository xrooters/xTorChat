//
//  OTRProtocolManager.h
//  Off the Record
//
//  Created byTopStar on 9/4/18.
//  Copyright (c) 2011TopStar. All rights reserved.
//
//  This file is part of xTorChat.

@import Foundation;
@import XMPPFramework;
#import "OTREncryptionManager.h"
#import "OTRSettingsManager.h"
#import "OTRProtocol.h"
#import "OTRAccountsManager.h"

@class OTRAccount, OTRXMPPAccount, OTRBuddy, OTROutgoingMessage, PushController, OTRXMPPManager;

NS_ASSUME_NONNULL_BEGIN
@interface OTRProtocolManager : NSObject

@property (atomic, readonly) NSUInteger numberOfConnectedProtocols;
@property (atomic, readonly) NSUInteger numberOfConnectingProtocols;

- (BOOL)existsProtocolForAccount:(OTRAccount *)account;
- (nullable id <OTRProtocol>)protocolForAccount:(OTRAccount *)account;
- (nullable OTRXMPPManager*)xmppManagerForAccount:(OTRAccount *)account;
- (void)removeProtocolForAccount:(OTRAccount *)account;
- (void)setProtocol:(id <OTRProtocol>)protocol forAccount:(OTRAccount *)account;

- (BOOL)isAccountConnected:(OTRAccount *)account;

- (void)loginAccount:(OTRAccount *)account;
- (void)loginAccount:(OTRAccount *)account userInitiated:(BOOL)userInitiated;
- (void)loginAccounts:(NSArray<OTRAccount*> *)accounts;
- (void)goAwayForAllAccounts;
- (void)disconnectAllAccounts;
- (void)disconnectAllAccountsSocketOnly:(BOOL)socketOnly timeout:(NSTimeInterval)timeout completionBlock:(nullable void (^)())completionBlock;

- (void)sendMessage:(OTROutgoingMessage *)message;

/** Shows UI to process an invite. Probably could be better handled somewhere else. */
+ (void)handleInviteForJID:(XMPPJID *)jid otrFingerprint:(nullable NSString *)otrFingerprint buddyAddedCallback:(nullable void (^)(OTRBuddy *buddy))buddyAddedCallback;

+ (instancetype)sharedInstance; // Singleton method

/** Convenience for sharedInstance */
@property (class, nonatomic, readonly) OTRProtocolManager *shared;

@end
NS_ASSUME_NONNULL_END
