//
//  Account.swift
//  xTorChatCore
//
//  Created byTopStar on 12/3/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

import Foundation

public extension OTRAccount {
    public func lastMessage(with transaction: YapDatabaseReadTransaction) -> OTRMessageProtocol? {
        guard let buddyTransaction = transaction.ext(OTRBuddyFilteredConversationsName) as? YapDatabaseFilteredViewTransaction,
        let lastBuddy = buddyTransaction.lastObject(inGroup: OTRConversationGroup) as? OTRBuddy,
        let lastMessage = lastBuddy.lastMessage(with: transaction) else {
            return nil
        }
        return lastMessage
    }
}
