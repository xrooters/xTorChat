//
//  UIActivity+xTorChat.m
//  xTorChat
//
//  Created by David Chiles on 10/27/14.
//  Copyright (c) 2014TopStar. All rights reserved.
//

#import "UIActivity+xTorChat.h"
@import ARChromeActivity;
@import TUSafariActivity;
#import "OTROpenInFacebookActivity.h"
#import "OTROpenInTwitterActivity.h"
@import OTRAssets;

@implementation UIActivity (xTorChat)

+ (NSArray<UIActivity*>*) otr_linkActivities {
    TUSafariActivity *safariActivity = [TUSafariActivity new];
    ARChromeActivity *chromeActivity = [ARChromeActivity new];
    chromeActivity.activityTitle = OPEN_IN_CHROME();
    chromeActivity.callbackURL = [NSURL URLWithString:@"chatsecure://"];
    OTROpenInTwitterActivity *twitterActivity = [OTROpenInTwitterActivity new];
    OTROpenInFacebookActivity *facebookActivity = [OTROpenInFacebookActivity new];
    NSArray *applicationActivites  = @[twitterActivity,facebookActivity,safariActivity,chromeActivity];
    return applicationActivites;
}

+ (CGSize)otr_defaultImageSize
{
    CGSize size = CGSizeZero;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        size = CGSizeMake(43, 43);
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        size = CGSizeMake(55, 55);
    }
    return size;
}

@end
