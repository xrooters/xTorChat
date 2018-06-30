//
//  XMPPMessage+xTorChat.swift
//  xTorChatCore
//
//  Created byTopStar on 10/18/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

import Foundation

public extension XMPPMessage {
    /// Safely extracts XEP-0359 stanza-id
    @objc public func extractStanzaId(account: OTRXMPPAccount, capabilities: XMPPCapabilities) -> String? {
        let stanzaIds = self.stanzaIds
        guard stanzaIds.count > 0 else {
            return nil
        }
        if let myJID = account.bareJID,
            let sid = stanzaIds[myJID] {
            return sid
        }
        if let fromJID = self.from?.bareJID,
            let sid = stanzaIds[fromJID] {
            return sid
        }
        return nil
    }
}
