//
//  XMPPMessage.swift
//  XMPPFramework
//
//  Created byTopStar on 11/21/18.
//  Copyright © 2018 XMPPFramework. All rights reserved.
//

import Foundation

public extension XMPPMessage {
    public enum MessageType: String {
        case chat
        case error
        case groupchat
        case headline
        case normal
    }
    
    public var messageType: MessageType? {
        guard let type = self.type else {
            return nil
        }
        return MessageType(rawValue: type)
    }
    
    public convenience init(messageType: MessageType? = nil,
                            to: XMPPJID? = nil,
                            elementID: String? = nil,
                            child: XMLElement? = nil) {
        self.init(type: messageType?.rawValue, to: to, elementID: elementID, child: child)
    }
}
