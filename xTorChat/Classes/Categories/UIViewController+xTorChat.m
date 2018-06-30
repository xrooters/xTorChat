//
//  UIViewController+xTorChat.m
//  xTorChat
//
//  Created by David Chiles on 9/30/14.
//  Copyright (c) 2014TopStar. All rights reserved.
//

#import "UIViewController+xTorChat.h"

@implementation UIViewController (xTorChat)

- (BOOL)otr_isVisible
{
    return (self.isViewLoaded && self.view.window);
}

@end
