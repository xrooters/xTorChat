//
//  UIActivity+xTorChat.h
//  xTorChat
//
//  Created by David Chiles on 10/27/14.
//  Copyright (c) 2014TopStar. All rights reserved.
//

@import UIKit;

@interface UIActivity (xTorChat)

+ (CGSize)otr_defaultImageSize;

/** Activities relevant for links */
@property (nonatomic, class, readonly) NSArray<UIActivity*> *otr_linkActivities;


@end
