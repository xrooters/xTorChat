//
//  HTMLPreviewView.swift
//  xTorChat
//
//  Created byTopStar on 5/30/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

import UIKit
import OTRAssets



public class HTMLPreviewView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var domainLabel: UILabel!
    
    @objc public func setURL(_ url: URL?, title: String?) {
        domainLabel.text = url?.host
        titleLabel.text = title ?? OPEN_IN_SAFARI()
    }

}
