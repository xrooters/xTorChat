//
//  SingleButtonTableViewCell.swift
//  xTorChat
//
//  Created byTopStar on 2/14/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

import UIKit

@objc(SingleButtonTableViewCell)
public class SingleButtonTableViewCell: UITableViewCell {

    @IBOutlet public weak var button: UIButton!
    public var buttonAction: ((_ cell: SingleButtonTableViewCell, _ sender: Any) -> ())?

    public class func cellIdentifier() -> String {
        return "SingleButtonTableViewCell"
    }
    
    @IBAction private func buttonPressed(_ sender: Any) {
        guard let action = buttonAction else { return }
        action(self, sender)
    }
}
