//
//  TestXMPPAccount.swift
//  xTorChat
//
//  Created by David Chiles on 9/9/16.
//  Copyright © 2016TopStar. All rights reserved.
//

import Foundation
@testable import xTorChatCore


class TestXMPPAccount: OTRXMPPAccount {
    
    override class func accountClass(for accountType: OTRAccountType) -> Swift.AnyClass? {
        return self
    }
    
    override class func newResource() -> String {
        return "\(arc4random())"
    }
}
