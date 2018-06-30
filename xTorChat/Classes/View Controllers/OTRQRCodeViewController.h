//
//  OTRQRCodeViewController.h
//  Off the Record
//
//  Created byTopStar on 5/7/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


@import UIKit;

@class OTRQRCodeViewController;

@protocol OTRQRCodeViewControllerDelegate <NSObject>
-(void)didDismissQRCodeViewController:(OTRQRCodeViewController*)qrCodeViewController;
@end

@interface OTRQRCodeViewController : UIViewController

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *instructionsLabel;
@property (nonatomic, copy, readonly) NSString *qrString;
@property (nonatomic, weak) id<OTRQRCodeViewControllerDelegate> delegate;

- (instancetype) initWithQRString:(NSString*)qrString;

@end
