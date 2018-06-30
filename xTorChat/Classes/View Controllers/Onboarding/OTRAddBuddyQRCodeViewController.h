//
//  OTRAddBuddyQRCodeViewController.h
//  xTorChat
//
//  Created by David Chiles on 7/9/15.
//  Copyright (c) 2015TopStar. All rights reserved.
//

#import "QRCodeReaderViewController.h"
@class OTRAccount;

@interface OTRAddBuddyQRCodeViewController : QRCodeReaderViewController

@property (nonatomic, strong) OTRAccount *account;

- (instancetype)initWithAccount:(OTRAccount *)account completion:(void (^)(void))completion;

@end
