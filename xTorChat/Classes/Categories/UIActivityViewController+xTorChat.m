//
//  UIActivityViewController+xTorChat.m
//  xTorChat
//
//  Created by David Chiles on 10/24/14.
//  Copyright (c) 2014TopStar. All rights reserved.
//

#import "UIActivityViewController+xTorChat.h"
@import ARChromeActivity;
@import TUSafariActivity;
#import "OTROpenInFacebookActivity.h"
#import "OTROpenInTwitterActivity.h"
@import OTRAssets;
#import "UIActivity+xTorChat.h"


@implementation UIActivityViewController (xTorChat)

+ (instancetype)otr_linkActivityViewControllerWithURLs:(NSArray *)urlArray
{
    if (!urlArray.count) {
        return nil;
    }
    return [[self alloc] initWithActivityItems:urlArray applicationActivities:UIActivity.otr_linkActivities];
}



@end
