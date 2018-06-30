//
//  OTRQRCodeViewController.m
//  Off the Record
//
//  Created byTopStar on 5/7/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


#import "OTRQRCodeViewController.h"
@import ZXingObjC;
@import PureLayout;
#import  <QuartzCore/CALayer.h>

@import OTRAssets;

@interface OTRQRCodeViewController()
@property (nonatomic, assign) BOOL didSetupConstraints;
@end

@implementation OTRQRCodeViewController

- (instancetype) initWithQRString:(NSString*)qrString {
    if (self = [super init]) {
        _qrString = qrString;
        self.title = QR_CODE_STRING();
    }
    return self;
}

- (UIImage*)imageForQRString:(NSString*)qrString size:(CGSize)size {
    if (!qrString) {
        return nil;
    }
    ZXMultiFormatWriter *writer = [[ZXMultiFormatWriter alloc] init];
    ZXBitMatrix *result = [writer encode:qrString
                                  format:kBarcodeFormatQRCode
                                   width:size.width
                                  height:size.height
                                   error:nil];
    if (result) {
        ZXImage *image = [ZXImage imageWithMatrix:result];
        return [UIImage imageWithCGImage:image.cgimage];
    } else {
        return nil;
    }
}

- (void) viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.imageView = [[UIImageView alloc] initForAutoLayout];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.layer.magnificationFilter = kCAFilterNearest;
    self.imageView.layer.shouldRasterize = YES;
    [self.view addSubview:self.imageView];
    
    self.instructionsLabel = [[UILabel alloc] initForAutoLayout];
    self.instructionsLabel.text = self.qrString;
    self.instructionsLabel.numberOfLines = 3;
    self.instructionsLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.instructionsLabel];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:DONE_STRING() style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonPressed:)];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        CGFloat padding = 10;
        [self.imageView autoPinToTopLayoutGuideOfViewController:self withInset:padding];
        [self.imageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:padding];
        [self.imageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:padding];
        [self.imageView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.instructionsLabel withOffset:padding];
        
        [self.instructionsLabel autoPinToBottomLayoutGuideOfViewController:self withInset:padding];
        [self.instructionsLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:padding];
        [self.instructionsLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:padding];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (void) viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
    
    UIImage *image = [self imageForQRString:self.qrString size:self.imageView.frame.size];
    self.imageView.image = image;
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void) doneButtonPressed:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(didDismissQRCodeViewController:)]) {
        [self.delegate didDismissQRCodeViewController:self];
    } else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
