//
//  OTRSettingsViewController.m
//  Off the Record
//
//  Created byTopStar on 4/10/12.
//  Copyright (c) 2012TopStar. All rights reserved.
//
//  This file is part of xTorChat.
//


#import "OTRSettingsViewController.h"
#import "OTRProtocolManager.h"
#import "OTRBoolSetting.h"
#import "OTRSettingTableViewCell.h"
#import "OTRSettingDetailViewController.h"
#import "OTRQRCodeViewController.h"
@import QuartzCore;
#import "OTRConstants.h"
#import "OTRAccountTableViewCell.h"
#import "OTRSecrets.h"
@import YapDatabase;
#import "OTRDatabaseManager.h"
#import "OTRDatabaseView.h"
#import "OTRAccount.h"
#import "OTRAppDelegate.h"
#import "OTRUtilities.h"
#import "OTRShareSetting.h"
#import "OTRActivityItemProvider.h"
#import "OTRQRCodeActivity.h"
#import "OTRBaseLoginViewController.h"
#import "OTRXLFormCreator.h"
#import "OTRViewSetting.h"
#import "OTRDonateSetting.h"
@import KVOController;
#import "OTRInviteViewController.h"
#import <xTorChatCore/xTorChatCore-Swift.h>
@import OTRAssets;
@import MobileCoreServices;

#import "NSURL+xTorChat.h"

static NSString *const circleImageName = @"31-circle-plus-large.png";

static NSString *const kSettingsCellIdentifier = @"kSettingsCellIdentifier";

@interface OTRSettingsViewController () <UITableViewDataSource, UITableViewDelegate, OTRShareSettingDelegate, OTRYapViewHandlerDelegateProtocol,OTRSettingDelegate,OTRDonateSettingDelegate, UIPopoverPresentationControllerDelegate, OTRAttachmentPickerDelegate>

@property (nonatomic, strong) OTRYapViewHandler *viewHandler;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIBarButtonItem *addBarButtonItem;

/** This is only non-nil during avatar picking */
@property (nonatomic, nullable) OTRAttachmentPicker *avatarPicker;

@end

@implementation OTRSettingsViewController

- (id) init
{
    if (self = [super init])
    {
        self.title = SETTINGS_STRING();
        _settingsManager = [[OTRSettingsManager alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //User main thread database connection
    self.viewHandler = [[OTRYapViewHandler alloc] initWithDatabaseConnection:[OTRDatabaseManager sharedInstance].longLivedReadOnlyConnection databaseChangeNotificationName:[DatabaseNotificationName LongLivedTransactionChanges]];
    self.viewHandler.delegate = self;
    [self.viewHandler setup:OTRAllAccountDatabaseViewExtensionName groups:@[OTRAllAccountGroup]];
    
    
    
    self.addBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed:)];
                             
    self.navigationItem.rightBarButtonItem = self.addBarButtonItem;
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.accessibilityIdentifier = @"settingsTableView";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[OTRAccountTableViewCell class] forCellReuseIdentifier:[OTRAccountTableViewCell cellIdentifier]];
    
    NSBundle *bundle = [OTRAssets resourcesBundle];
    UINib *nib = [UINib nibWithNibName:[XMPPAccountCell cellIdentifier] bundle:bundle];
    [self.tableView registerNib:nib forCellReuseIdentifier:[XMPPAccountCell cellIdentifier]];
    
    
    ////// KVO //////
    __weak typeof(self)weakSelf = self;
    [self.KVOController observe:[OTRProtocolManager sharedInstance] keyPaths:@[NSStringFromSelector(@selector(numberOfConnectedProtocols)),NSStringFromSelector(@selector(numberOfConnectingProtocols))] options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        __strong typeof(weakSelf)strongSelf = weakSelf;
        dispatch_async(dispatch_get_main_queue(), ^{
            [strongSelf.tableView reloadSections:[[NSIndexSet alloc] initWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
        });
    }];
}

- (void)addButtonPressed:(id)sender
{
    OTRBaseLoginViewController * login = [[OTRBaseLoginViewController alloc] init];
    [login initWithNewAccountType:OTRAccountTypeJabber];
    [self.navigationController pushViewController:login animated:YES];
}
- (void) setupVersionLabel {
    UIButton *versionButton = [[UIButton alloc] init];
    NSString *bundleVersion = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"];
    NSString *buildNumber = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleVersion"];
    NSString *versionTitle = [NSString stringWithFormat:@"%@ %@ (%@)", VERSION_STRING(), bundleVersion, buildNumber];
    [versionButton setTitle:versionTitle forState:UIControlStateNormal];
    [versionButton setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
    [versionButton addTarget:self action:@selector(versionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [versionButton sizeToFit];
    CGRect frame = versionButton.frame;
    frame.size.height = frame.size.height * 2;
    versionButton.frame = frame;
    self.tableView.tableFooterView = versionButton;
}

- (void) versionButtonPressed:(id)sender {
    // Licenses are in Settings bundle now
    NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    [UIApplication.sharedApplication openURL:settingsURL];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(serverCheckUpdate:) name:ServerCheck.UpdateNotificationName object:nil];
    self.tableView.frame = self.view.bounds;
    [self.settingsManager populateSettings];
    [self.tableView reloadData];
}

- (void) serverCheckUpdate:(NSNotification*)notification {
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return YES;
    } else {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    }
}

- (OTRXMPPAccount *)accountAtIndexPath:(NSIndexPath *)indexPath
{
    OTRXMPPAccount *account = [self.viewHandler object:indexPath];
    return account;
}

#pragma mark UITableViewDataSource methods

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return UITableViewCellEditingStyleDelete;
  
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *addAccountCellIdentifier = @"addAccountCellIdentifier";
        UITableViewCell * cell = nil;
    
        OTRXMPPAccount *account = [self accountAtIndexPath:indexPath];
        OTRXMPPManager *xmpp = (OTRXMPPManager*)[[OTRProtocolManager sharedInstance] protocolForAccount:account];
        XMPPAccountCell *accountCell = [tableView dequeueReusableCellWithIdentifier:[XMPPAccountCell cellIdentifier] forIndexPath:indexPath];
        [accountCell setAppearanceWithAccount:account];
    
        NSMutableString *labelString = [NSMutableString stringWithString:accountCell.accountNameLabel.text];
//            if (xmpp.lastConnectionError) {
//                [labelString appendString:@" ❌"];
//            } else if (xmpp.serverCheck.getCombinedPushStatus == ServerCheckPushStatusBroken) {
//                if ([OTRBranding shouldShowPushWarning]) {
//                    [labelString appendString:@"  ⚠️"];
//                }
//            }
        accountCell.accountNameLabel.text = labelString;

   
        accountCell.avatarButtonAction = ^(UITableViewCell *cell, id sender) {
            self.avatarPicker = [[OTRAttachmentPicker alloc] initWithParentViewController:self delegate:self];
            self.avatarPicker.tag = account;
            [self.avatarPicker showAlertControllerFromSourceView:cell withCompletion:nil];
        };
        accountCell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell = accountCell;
 
        return cell;
}

- (void) accountCellShareButtonPressed:(id)sender {
//    if ([sender isKindOfClass:[UIButton class]]) {
//        UIButton *button = sender;
//        OTRAccountTableViewCell *cell = (OTRAccountTableViewCell*)button.superview;
//        OTRAccount *account = cell.account;
//        [ShareController shareAccount:account sender:sender viewController:self];
//    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return [self.viewHandler.mappings numberOfItemsInSection:0];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.viewHandler.mappings numberOfItemsInSection:indexPath.section]) {
        return 50.0;
    } else {
        return [XMPPAccountCell cellHeight];
    }
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Available accounts";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.viewHandler.mappings numberOfItemsInSection:0]) {
        [self addAccount:[tableView cellForRowAtIndexPath:indexPath]];
    } else {
        OTRXMPPAccount *account = [self accountAtIndexPath:indexPath];
        [self showAccountDetailsView:account];
    }
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section != 0) {
        return;
    }
    if (editingStyle == UITableViewCellEditingStyleDelete) 
    {
        OTRAccount *account = [self accountAtIndexPath:indexPath];
        
        UIAlertAction * cancelButtonItem = [UIAlertAction actionWithTitle:CANCEL_STRING() style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction * okButtonItem = [UIAlertAction actionWithTitle:OK_STRING() style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            if( [[OTRProtocolManager sharedInstance] isAccountConnected:account])
            {
                id<OTRProtocol> protocol = [[OTRProtocolManager sharedInstance] protocolForAccount:account];
                [protocol disconnect];
            }
            [[OTRProtocolManager sharedInstance] removeProtocolForAccount:account];
            [OTRAccountsManager removeAccount:account];
        }];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"xTorChat" message:DELETE_ACCOUNT_MESSAGE_STRING() preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:cancelButtonItem];
        [alert addAction:okButtonItem];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

#pragma - mark Other Methods

- (void) showAccountDetailsView:(OTRXMPPAccount*)account {
    
    
    OTRBaseLoginViewController * login = [[OTRBaseLoginViewController alloc] init];
    [login initWithAccount : account];
    [self.navigationController pushViewController:login animated:YES];

 
}

- (void) addAccount:(id)sender {
    OTRBaseLoginViewController * login = [[OTRBaseLoginViewController alloc] init];
    [login initWithNewAccountType:OTRAccountTypeJabber];
    [self presentViewController:login animated:YES completion:nil];
}

- (NSIndexPath *)indexPathForSetting:(OTRSetting *)setting
{
    return [self.settingsManager indexPathForSetting:setting];
}

#pragma mark OTRSettingDelegate method

- (void)refreshView
{
    [self.tableView reloadData];
}

#pragma mark OTRSettingViewDelegate method
- (void) otrSetting:(OTRSetting*)setting showDetailViewControllerClass:(Class)viewControllerClass
{
    if (viewControllerClass == [EnablePushViewController class]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Onboarding" bundle:[OTRAssets resourcesBundle]];
        EnablePushViewController *enablePushVC = [storyboard instantiateViewControllerWithIdentifier:@"enablePush"];
        enablePushVC.modalPresentationStyle = UIModalPresentationFormSheet;
        if (enablePushVC) {
            [self presentViewController:enablePushVC animated:YES completion:nil];
        }
        return;
    }
    UIViewController *viewController = [[viewControllerClass alloc] init];
    viewController.title = setting.title;
    if ([viewController isKindOfClass:[OTRSettingDetailViewController class]]) 
    {
        OTRSettingDetailViewController *detailSettingViewController = (OTRSettingDetailViewController*)viewController;
        detailSettingViewController.otrSetting = setting;
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:detailSettingViewController];
        navController.modalPresentationStyle = UIModalPresentationFormSheet;
        [self presentViewController:navController animated:YES completion:nil];
    } else {
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

- (void) donateSettingPressed:(OTRDonateSetting *)setting {
    [PurchaseViewController showFrom:self];
}

#pragma - mark OTRAttachmentPickerDelegate

- (void)attachmentPicker:(OTRAttachmentPicker *)attachmentPicker gotPhoto:(UIImage *)photo withInfo:(NSDictionary *)info {
    self.avatarPicker = nil;
    OTRXMPPAccount *account = attachmentPicker.tag;
    if (![account isKindOfClass:OTRXMPPAccount.class]) {
        return;
    }
    OTRXMPPManager *xmpp = (OTRXMPPManager*)[OTRProtocolManager.shared protocolForAccount:account];
    if (![xmpp isKindOfClass:OTRXMPPManager.class]) {
        return;
    }
    [xmpp setAvatar:photo completion:nil];
}

- (void)attachmentPicker:(OTRAttachmentPicker *)attachmentPicker gotVideoURL:(NSURL *)videoURL {
    self.avatarPicker = nil;
}

- (NSArray <NSString *>*)attachmentPicker:(OTRAttachmentPicker *)attachmentPicker preferredMediaTypesForSource:(UIImagePickerControllerSourceType)source
{
    return @[(NSString*)kUTTypeImage];
}

#pragma - mark OTRShareSettingDelegate Method

- (void)didSelectShareSetting:(OTRShareSetting *)shareSetting
{
    OTRActivityItemProvider * itemProvider = [[OTRActivityItemProvider alloc] initWithPlaceholderItem:@""];
    OTRQRCodeActivity * qrCodeActivity = [[OTRQRCodeActivity alloc] init];
    
    UIActivityViewController * activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[itemProvider] applicationActivities:@[qrCodeActivity]];
    activityViewController.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[self indexPathForSetting:shareSetting]];
    
    activityViewController.popoverPresentationController.sourceView = cell;
    activityViewController.popoverPresentationController.sourceRect = cell.bounds;
    
    [self presentViewController:activityViewController animated:YES completion:nil];
}

#pragma mark OTRFeedbackSettingDelegate method

- (void) presentFeedbackViewForSetting:(OTRSetting *)setting {
    NSURL *githubURL = OTRBranding.githubURL;
    if (!githubURL) { return; }
    NSURL *githubIssues = [githubURL URLByAppendingPathComponent:@"issues"];
    [UIApplication.sharedApplication openURL:githubIssues];
}

#pragma - mark YapDatabse Methods

- (void)didSetupMappings:(OTRYapViewHandler *)handler
{
    [self.tableView reloadData];
}

- (void)didReceiveChanges:(OTRYapViewHandler *)handler sectionChanges:(NSArray<YapDatabaseViewSectionChange *> *)sectionChanges rowChanges:(NSArray<YapDatabaseViewRowChange *> *)rowChanges
{
    if ([rowChanges count] == 0) {
        return;
    }
    
    [self.tableView beginUpdates];
    
    for (YapDatabaseViewRowChange *rowChange in rowChanges)
    {
        switch (rowChange.type)
        {
            case YapDatabaseViewChangeDelete :
            {
                [self.tableView deleteRowsAtIndexPaths:@[ rowChange.indexPath ]
                                      withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            }
            case YapDatabaseViewChangeInsert :
            {
                [self.tableView insertRowsAtIndexPaths:@[ rowChange.newIndexPath ]
                                      withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            }
            case YapDatabaseViewChangeMove :
            {
                [self.tableView deleteRowsAtIndexPaths:@[ rowChange.indexPath ]
                                      withRowAnimation:UITableViewRowAnimationAutomatic];
                [self.tableView insertRowsAtIndexPaths:@[ rowChange.newIndexPath ]
                                      withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            }
            case YapDatabaseViewChangeUpdate :
            {
                [self.tableView reloadRowsAtIndexPaths:@[ rowChange.indexPath ]
                                      withRowAnimation:UITableViewRowAnimationNone];
                break;
            }
        }
    }
    
    [self.tableView endUpdates];
}


@end
