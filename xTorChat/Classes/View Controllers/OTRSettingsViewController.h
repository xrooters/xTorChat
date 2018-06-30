//
//  OTRSettingsViewController.h
//  Off the Record
//
//  Created byTopStar on 4/10/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


@import UIKit;
@import MessageUI;
#import "OTRSettingsManager.h"

NS_ASSUME_NONNULL_BEGIN
@interface OTRSettingsViewController : UIViewController <MFMailComposeViewControllerDelegate>

/** This property can be replaced with a custom subclass before displaying the view */
@property (nonatomic, strong) OTRSettingsManager *settingsManager;

@end
NS_ASSUME_NONNULL_END
