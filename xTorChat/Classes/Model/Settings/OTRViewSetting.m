//
//  OTRViewSetting.m
//  Off the Record
//
//  Created byTopStar on 4/11/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


#import "OTRViewSetting.h"
@import UIKit;

@implementation OTRViewSetting
@synthesize viewControllerClass, delegate;

- (id) initWithTitle:(NSString*)newTitle description:(NSString*)newDescription viewControllerClass:(Class)newViewControllerClass;
{
    if (self = [super initWithTitle:newTitle description:newDescription])
    {
        viewControllerClass = newViewControllerClass;
        __weak typeof (self) weakSelf = self;
        self.actionBlock = ^void(id sender){
            [weakSelf showView];
        };
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    return self;
}

- (void) showView
{
    [self.delegate otrSetting:self showDetailViewControllerClass:viewControllerClass];
}


@end
