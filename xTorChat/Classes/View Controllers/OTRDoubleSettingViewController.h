//
//  OTRDoubleSettingDetailViewController.h
//  Off the Record
//
//  Created byTopStar on 4/24/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


#import "OTRSettingDetailViewController.h"
#import "OTRDoubleSetting.h"

@interface OTRDoubleSettingViewController : OTRSettingDetailViewController <UITableViewDelegate, UITableViewDataSource>
{
    double newValue;
}

@property (nonatomic, retain) UILabel *descriptionLabel;
@property (nonatomic, retain) UITableView *valueTable;
@property (nonatomic, retain) UILabel *valueLabel;
@property (nonatomic, retain) OTRDoubleSetting *otrSetting;
@property (nonatomic, retain) NSIndexPath *selectedPath;

@end
