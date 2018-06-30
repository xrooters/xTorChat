//
//  OTRTestDatabase.swift
//  xTorChatCore
//
//  Created by David Chiles on 10/7/16.
//  Copyright © 2016TopStar. All rights reserved.
//

import UIKit
@testable import xTorChatCore

extension OTRDatabaseManager {
    func setupTestDatabase(name: String) {
        setDatabasePassphrase("password", remember: false, error: nil)
        let uuid = UUID().uuidString
        let tmpDir = NSTemporaryDirectory() as NSString
        let databaseDir = tmpDir.appendingPathComponent(uuid)
        setupDatabase(withName: name, directory: databaseDir, withMediaStorage: false)
    }
}

extension FileManager {
    func clearDirectory(_ directory:String) {
        // Clear any Files in directy
        do {
            let contents = try self.contentsOfDirectory(atPath: directory)
            try contents.forEach { (path) in
                let fullPath = (directory as NSString).appendingPathComponent(path)
                try FileManager().removeItem(atPath: fullPath)
            }
        } catch let err {
            debugPrint("Error clearing test database \(err)")
        }
    }
}
