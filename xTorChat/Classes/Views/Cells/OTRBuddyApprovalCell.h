//
//  OTRBuddyApprovalCell.h
//  xTorChat
//
//  Created byTopStar on 6/1/16.
//  Copyright © 2016TopStar. All rights reserved.
//

#import "OTRBuddyInfoCell.h"
@import BButton;

@interface OTRBuddyApprovalCell : OTRBuddyInfoCell

@property (nonatomic, strong) BButton *approveButton;
@property (nonatomic, strong) BButton *denyButton;
@property (nonatomic, copy) void (^actionBlock)(OTRBuddyApprovalCell *cell, BOOL approved);

@end
