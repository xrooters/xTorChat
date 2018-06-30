//
//  OTRViewSetting.h
//  Off the Record
//
//  Created byTopStar on 4/11/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


#import "OTRSetting.h"
@import UIKit;

@interface OTRViewSetting : OTRSetting

@property (nonatomic, retain, readonly) Class viewControllerClass;
@property (nonatomic) UITableViewCellAccessoryType accessoryType;

- (id) initWithTitle:(NSString*)newTitle description:(NSString*)newDescription viewControllerClass:(Class)newViewControllerClass;

- (void) showView;

@end
