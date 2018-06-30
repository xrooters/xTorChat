//
//  OTRSettingDetailViewController.m
//  Off the Record
//
//  Created byTopStar on 4/24/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


#import "OTRSettingDetailViewController.h"
#import "OTRSetting.h"
@import OTRAssets;

@interface OTRSettingDetailViewController()
@property (nonatomic, strong) UIBarButtonItem *saveButton;
@property (nonatomic, strong) UIBarButtonItem *cancelButton;
@end


@implementation OTRSettingDetailViewController
@synthesize otrSetting, saveButton, cancelButton;

- (void) dealloc {
    self.saveButton = nil;
    self.otrSetting = nil;
    self.cancelButton = nil;
}

- (id) init {
    if (self = [super init]) {
        self.saveButton = [[UIBarButtonItem alloc] initWithTitle:SAVE_STRING() style:UIBarButtonItemStyleDone target:self action:@selector(save:)];
        self.cancelButton = [[UIBarButtonItem alloc] initWithTitle:CANCEL_STRING() style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    }
    return self;
}

- (void) loadView {
    [super loadView];
    self.title = self.otrSetting.title;
    self.navigationItem.rightBarButtonItem = saveButton;
    self.navigationItem.leftBarButtonItem = cancelButton;
}

- (void) save:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (CGSize) textSizeForLabel:(UILabel*)label {
    return [label.text sizeWithAttributes:
            @{NSFontAttributeName:label.font}];
}

@end
