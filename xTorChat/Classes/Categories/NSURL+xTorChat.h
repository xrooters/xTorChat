//
//  NSURL+xTorChat.h
//  xTorChat
//
//  Created by David Chiles on 9/5/14.
//  Copyright (c) 2014TopStar. All rights reserved.
//

@import Foundation;
@import UIKit;
@import XMPPFramework;

NS_ASSUME_NONNULL_BEGIN
@interface NSURL (xTorChat)

@property (nonatomic, class, readonly) NSURL *otr_githubURL;

@property (nonatomic, class, readonly) NSURL *otr_facebookAppURL;
@property (nonatomic, class, readonly) NSURL *otr_facebookWebURL;

@property (nonatomic, class, readonly) NSURL *otr_twitterAppURL;
@property (nonatomic, class, readonly) NSURL *otr_twitterWebURL;

@property (nonatomic, class, readonly) NSURL *otr_transifexURL;
@property (nonatomic, class, readonly) NSURL *otr_projectURL;

@property (nonatomic, class, readonly) NSURL *otr_shareBaseURL;

+ (nullable NSURL*) otr_shareLink:(NSURL *)baseURL
                              jid:(XMPPJID *)jid
                       queryItems:(nullable NSArray<NSURLQueryItem*> *)queryItems;


- (void) otr_decodeShareLink:(void (^)(XMPPJID * _Nullable jid, NSArray<NSURLQueryItem*> * _Nullable queryItems))completion;

+ (BOOL) otr_queryItemsContainMigrationHint:(NSArray<NSURLQueryItem*> *)queryItems;

@property (nonatomic, readonly) BOOL otr_isInviteLink;

- (void) promptToShowURLFromViewController:(UIViewController*)viewController sender:(id)sender;

@end

@interface UIViewController (xTorChatURL)
- (void) promptToShowURL:(NSURL*)url sender:(id)sender;
@end
NS_ASSUME_NONNULL_END
