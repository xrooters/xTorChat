//
//  XMPPIQ.swift
//  XMPPFramework
//
//  Created byTopStar on 11/14/18.
//  Copyright © 2018 XMPPFramework. All rights reserved.
//

import Foundation

public extension XMPPIQ {
    public enum IQType: String {
        case get
        case set
        case result
        case error
    }
    
    public var iqType: IQType? {
        guard let type = self.type else { return nil }
        let iqType = IQType(rawValue: type)
        return iqType
    }
    
    public convenience init(iqType: IQType,
                            to JID: XMPPJID? = nil,
                            elementID eid: String? = nil,
                            child childElement: XMLElement? = nil) {
        self.init(type: iqType.rawValue, to: JID, elementID: eid, child: childElement)
    }
}
