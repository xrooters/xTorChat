//
//  UITableView+xTorChat.m
//  xTorChat
//
//  Created byTopStar on 4/24/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

#import "UITableView+xTorChat.h"
#import "OTRXMPPBuddy.h"
#import <xTorChatCore/xTorChatCore-Swift.h>
#import "OTRXMPPManager_Private.h"
@import OTRAssets;

@implementation UITableView (xTorChat)

/** Connection must be read-write */
+ (nullable NSArray<UITableViewRowAction *> *)editActionsForThread:(id<OTRThreadOwner>)thread deleteActionAlsoRemovesFromRoster:(BOOL)deleteActionAlsoRemovesFromRoster connection:(YapDatabaseConnection*)connection {
    NSParameterAssert(thread);
    NSParameterAssert(connection);
    if (!thread || !connection) {
        return nil;
    }
    
    // Bail out if it's a subscription request
    if ([thread isKindOfClass:[OTRXMPPBuddy class]] &&
        [(OTRXMPPBuddy*)thread askingForApproval]) {
        return nil;
    }

    NSString *archiveTitle = ARCHIVE_ACTION_STRING();
    if ([thread isArchived]) {
        archiveTitle = UNARCHIVE_ACTION_STRING();
    }
    
  
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:DELETE_STRING() handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        [connection asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
            [OTRBaseMessage deleteAllMessagesForBuddyId:[thread threadIdentifier] transaction:transaction];
        }];
        
        if ([thread isKindOfClass:[OTRXMPPRoom class]]) {
            OTRXMPPRoom *room = (OTRXMPPRoom*)thread;
            //Leave room
            NSString *accountKey = [thread threadAccountIdentifier];
            __block OTRAccount *account = nil;
            [connection readWithBlock:^(YapDatabaseReadTransaction * _Nonnull transaction) {
                account = [OTRAccount fetchObjectWithUniqueID:accountKey transaction:transaction];
            }];
            OTRXMPPManager *xmppManager = (OTRXMPPManager *)[[OTRProtocolManager sharedInstance] protocolForAccount:account];
            if (room.roomJID) {
                [xmppManager.roomManager leaveRoom:room.roomJID];
            }
            [xmppManager.roomManager removeRoomsFromBookmarks:@[room]];
            
            //Delete database items
            [connection asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
                [((OTRXMPPRoom *)thread) removeWithTransaction:transaction];
            }];
        } else if ([thread isKindOfClass:[OTRBuddy class]] && deleteActionAlsoRemovesFromRoster) {
            OTRBuddy *dbBuddy = (OTRBuddy*)thread;
            OTRYapRemoveBuddyAction *action = [[OTRYapRemoveBuddyAction alloc] init];
            action.buddyKey = dbBuddy.uniqueId;
            action.buddyJid = dbBuddy.username;
            action.accountKey = dbBuddy.accountUniqueId;
            [connection asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
                [action saveWithTransaction:transaction];
                [dbBuddy removeWithTransaction:transaction];
            }];
        }
    }];
    
    return @[deleteAction];
}

@end
