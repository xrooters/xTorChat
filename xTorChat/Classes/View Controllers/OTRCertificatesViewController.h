//
//  OTRCertificatesViewController.h
//  Off the Record
//
//  Created by David Chiles on 12/9/13.
//  Copyright (c) 2013TopStar. All rights reserved.
//

@import UIKit;

@interface OTRCertificatesViewController : UITableViewController


- (id)initWithHostName:(NSString *)hostname withCertificates:(NSArray *)certificates;

@property (nonatomic) BOOL canEdit;

@end
