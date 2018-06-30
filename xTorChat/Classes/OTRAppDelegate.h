//
//  OTRAppDelegate.h
//  Off the Record
//
@import UIKit;
@import LCTabBarController;
@class OTRSplitViewCoordinator, OTRConversationViewController, OTRMessagesViewController, OTRMainViewController;
@protocol AppTheme;

NS_ASSUME_NONNULL_BEGIN

@interface OTRAppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong, readonly) OTRConversationViewController *conversationViewController;
@property (nonatomic, strong, readonly) OTRMessagesViewController *messagesViewController;
@property (nonatomic, strong, readonly) OTRSplitViewCoordinator *splitViewCoordinator;
@property (nonatomic, strong) LCTabBarController *tabbar;

/** Only used from Database Unlock view. */
- (void) showConversationViewController;

@property (class, nonatomic, readonly) __kindof OTRAppDelegate *appDelegate;

@end


NS_ASSUME_NONNULL_END
