//
//  OTRAccountMigrator.h
//  xTorChat
//
//  Created byTopStar on 5/9/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

#import <Foundation/Foundation.h>
@class OTRXMPPAccount;

typedef NS_ENUM(NSUInteger, MigratorError) {
    MigratorErrorUnknown = 0,
    MigratorErrorInProgress
};

NS_ASSUME_NONNULL_BEGIN
@interface OTRAccountMigrator : NSObject

@property (nonatomic, strong, readonly) OTRXMPPAccount *oldAccount;
@property (nonatomic, strong, readonly) OTRXMPPAccount *migratedAccount;
@property (nonatomic, readonly) BOOL shouldSpamFriends;

- (instancetype) initWithOldAccount:(OTRXMPPAccount*)oldAccount
                    migratedAccount:(OTRXMPPAccount*)migratedAccount
                  shouldSpamFriends:(BOOL)shouldSpamFriends NS_DESIGNATED_INITIALIZER;

- (instancetype) init NS_UNAVAILABLE;

- (void) migrateWithCompletion:(void (^)(BOOL success, NSError * _Nullable error))completion;

@end
NS_ASSUME_NONNULL_END
