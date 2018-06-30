//
//  OTRComposingImageView.h
//  Off the Record
//
//  Created by David Chiles on 1/27/14.
//  Copyright (c) 2014TopStar. All rights reserved.
//

@import UIKit;

@interface OTRComposingImageView : UIImageView

@property (nonatomic,readonly,getter = isBlinking) BOOL blinking;

- (void)startBlinking;
- (void)stopBlinking;

@end
