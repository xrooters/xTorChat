//
//  OTRSettingDetailViewController.h
//  Off the Record
//
//  Created byTopStar on 4/24/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


@import UIKit;
#import "OTRSetting.h"

@interface OTRSettingDetailViewController : UIViewController

@property (nonatomic, strong) OTRSetting *otrSetting;

- (void) save:(id)sender;
- (CGSize) textSizeForLabel:(UILabel*)label;

@end
