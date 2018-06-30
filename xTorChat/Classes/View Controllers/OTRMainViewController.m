//
//  OTRMainViewController.m
//  xTorChatCore
//
//  Created by TopStar on 6/23/18.
//  Copyright © 2018TopStar. All rights reserved.
//

#import "OTRMainViewController.h"
#import <EAIntroView/EAIntroView.h>
@import OTRAssets;
@interface OTRMainViewController ()

@end

@implementation OTRMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // basic
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = @"sampleDescription1";
    // custom
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.titlePositionY = 220;
    page2.desc = @"sampleDescription2";
    page2.descPositionY = 200;
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic-users" inBundle:[OTRAssets resourcesBundle] compatibleWithTraitCollection:nil]];
    page2.titleIconPositionY = 100;
  
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2]];
    [intro showInView:self.view animateDuration:0.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
