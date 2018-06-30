//
//  OTRProtocol.h
//  Off the Record
//
//  Created byTopStar on 6/25/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


@class OTROutgoingMessage, OTRBuddy, OTRAccount;
@protocol PushControllerProtocol;

typedef NS_ENUM(int, OTRProtocolType) {
    OTRProtocolTypeNone        = 0,
    OTRProtocolTypeXMPP        = 1,
    OTRProtocolTypeOscar       = 2 // deprecated
};

typedef NS_ENUM(NSInteger, OTRLoginStatus) {
    OTRLoginStatusDisconnected = 0,
    OTRLoginStatusDisconnecting,
    OTRLoginStatusConnecting,
    OTRLoginStatusConnected,
    OTRLoginStatusSecuring,
    OTRLoginStatusSecured,
    OTRLoginStatusAuthenticating,
    OTRLoginStatusAuthenticated
};

NS_ASSUME_NONNULL_BEGIN
@protocol OTRProtocol <NSObject>

/** Send a message immediately. Bypasses (and used by) the message queue. */
- (void) sendMessage:(OTROutgoingMessage*)message;

- (void) connect;
- (void) connectUserInitiated:(BOOL)userInitiated;

- (void) disconnect;
- (void) disconnectSocketOnly:(BOOL)socketOnly;
- (void) addBuddy:(OTRBuddy *)newBuddy;
- (void) addBuddies:(NSArray<OTRBuddy*> *)buddies;

- (void) removeBuddies:(NSArray<OTRBuddy*> *)buddies;
- (void) blockBuddies:(NSArray<OTRBuddy*> *)buddies;

- (instancetype) initWithAccount:(OTRAccount*)account;

@end

@protocol OTRXMPPProtocol <OTRProtocol>
- (void)sendChatState:(int)chatState withBuddy:(OTRBuddy *)buddy;
- (void) setDisplayName:(NSString *) newDisplayName forBuddy:(OTRBuddy *)buddy;
@end
NS_ASSUME_NONNULL_END
