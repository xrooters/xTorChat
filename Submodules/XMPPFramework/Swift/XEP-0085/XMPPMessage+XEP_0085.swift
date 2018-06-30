//
//  XMPPMessage+XEP_0085.swift
//  XMPPFramework
//
//  Created byTopStar on 11/21/18.
//  Copyright © 2018 XMPPFramework. All rights reserved.
//

import Foundation

/// XEP-0085: Chat States
/// https://xmpp.org/extensions/xep-0085.html
public extension XMPPMessage {
    public enum ChatState: String {
        case active
        case composing
        case paused
        case inactive
        case gone
    }
    
    public var chatState: ChatState? {
        guard let chatState = self.chatStateValue else {
            return nil
        }
        return ChatState(rawValue: chatState)
    }
    
    public func addChatState(_ chatState: ChatState) {
        let element = XMLElement(name: chatState.rawValue, xmlns: ChatStatesXmlns)
        addChild(element)
    }
}
