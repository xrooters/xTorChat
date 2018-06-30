//
//  OTRAudioControlsView.h
//  xTorChat
//
//  Created by David Chiles on 1/28/15.
//  Copyright (c) 2015TopStar. All rights reserved.
//

@import UIKit;

@class  OTRPlayPauseProgressView;

extern NSInteger const kOTRAudioControlsViewTag;

@interface OTRAudioControlsView : UIView

@property (nonatomic, strong, readonly) OTRPlayPauseProgressView *playPuaseProgressView;
@property (nonatomic, strong, readonly) UILabel *timeLabel;

- (void)setTime:(NSTimeInterval)time;

@end
