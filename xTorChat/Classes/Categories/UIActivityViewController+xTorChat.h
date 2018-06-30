//
//  UIActivityViewController+xTorChat.h
//  xTorChat
//
//  Created by David Chiles on 10/24/14.
//  Copyright (c) 2014TopStar. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN
@interface UIActivityViewController (xTorChat)

+ (nullable instancetype)otr_linkActivityViewControllerWithURLs:(NSArray<NSURL*> *)urlArray;

@end
NS_ASSUME_NONNULL_END
