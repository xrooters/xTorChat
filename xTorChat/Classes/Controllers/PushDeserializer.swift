//
//  PushDeserializer.swift
//  xTorChat
//
//  Created by David Chiles on 9/24/15.
//  Copyright © 2015TopStar. All rights reserved.
//

import Foundation
import ChatSecure_Push_iOS

open class PushDeserializer: NSObject  {
    
    open class func deserializeToken(_ data:Data) throws -> [TokenContainer] {
        guard let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as? [String:AnyObject] else {
            throw NSError.xTorChatError(PushError.invalidJSON, userInfo: nil)
        }
        
        guard let apiEndPoint = jsonDictionary[jsonKeys.endpoint.rawValue] as? String else {
            throw NSError.xTorChatError(PushError.missingAPIEndpoint, userInfo: nil)
        }
        
        let apiURL = URL(string: apiEndPoint)
        
        guard let tokenStrings = jsonDictionary[jsonKeys.tokens.rawValue] as? [String] else {
            throw NSError.xTorChatError(PushError.missingTokens, userInfo: nil)
        }
        
        var tokenArray:[TokenContainer] = []
        for tokenString in tokenStrings {
            let pushToken = Token(tokenString: tokenString,type: .unknown, deviceID: nil)
            if let tokenContainer = TokenContainer() {
                tokenContainer.pushToken = pushToken
                tokenContainer.endpoint = apiURL
                tokenArray.append(tokenContainer)
            }
        }
        
        return tokenArray
    }
}
