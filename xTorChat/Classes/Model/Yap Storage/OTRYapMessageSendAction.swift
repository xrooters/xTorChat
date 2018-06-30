//
//  OTRYapMessageSendAction.swift
//  xTorChat
//
//  Created by David Chiles on 10/28/16.
//  Copyright © 2016TopStar. All rights reserved.
//

import Foundation
import YapTaskQueue
import YapDatabase

public extension OTRYapMessageSendAction: YapDatabaseRelationshipNode {
    
    // Relationship only really used to make sure tasks are deleted when messages are deleted
    public func yapDatabaseRelationshipEdges() -> [YapDatabaseRelationshipEdge]? {
        let edge = YapDatabaseRelationshipEdge(name: RelationshipEdgeName.messageActionEdgeName.name(), destinationKey: self.messageKey, collection: self.messageCollection, nodeDeleteRules: .deleteSourceIfDestinationDeleted)
        return [edge]
    }
    
}
