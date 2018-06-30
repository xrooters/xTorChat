//
//  OTRSetting.h
//  Off the Record
//
//  Created byTopStar on 4/11/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


@import Foundation;

@class OTRSetting;

@protocol OTRSettingDelegate <NSObject>
@required
- (void) refreshView;
- (void) otrSetting:(OTRSetting*)setting showDetailViewControllerClass:(Class)viewControllerClass;
@end

typedef void (^OTRSettingActionBlock)(id sender);

@interface OTRSetting : NSObject

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *settingDescription;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, weak) id<OTRSettingDelegate> delegate;
@property (nonatomic, copy) OTRSettingActionBlock actionBlock;

- (id) initWithTitle:(NSString *)newTitle description:(NSString *)newDescription;

@end
