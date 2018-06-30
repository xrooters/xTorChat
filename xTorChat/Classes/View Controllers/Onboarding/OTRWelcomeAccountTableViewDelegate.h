//
//  OTRWelcomeAccountTableViewDelegate.h
//  xTorChat
//
//  Created by David Chiles on 5/7/15.
//  Copyright (c) 2015TopStar. All rights reserved.
//

@import Foundation;
@class OTRWelcomeAccountInfo;

@import UIKit;

@interface OTRWelcomeAccountTableViewDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *welcomeAccountInfoArray;

@end
