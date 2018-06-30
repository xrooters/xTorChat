//
//  UIViewController+xTorChat.swift
//  xTorChat
//
//  Created byTopStar on 2/16/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

import UIKit
import OTRAssets

public extension UIViewController {
    /// Will show a prompt to bring user into system settings
    public func showPromptForSystemSettings() {
        let alert = UIAlertController(title: "xTorChat", message: nil, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: SETTINGS_STRING(), style: .default, handler: { (action: UIAlertAction) -> Void in
            let appSettings = URL(string: UIApplicationOpenSettingsURLString)
            UIApplication.shared.openURL(appSettings!)
        })
        let cancelAction = UIAlertAction(title: CANCEL_STRING(), style: .cancel, handler: nil)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    public func showDestructivePrompt(title: String?, buttonTitle: String, handler: @escaping ((_ action: UIAlertAction) -> ())) {
        let alert = UIAlertController(title: "xTorChat", message: nil, preferredStyle: .actionSheet)
        let destroyAction = UIAlertAction(title: buttonTitle, style: .destructive, handler: handler)
        let cancelAction = UIAlertAction(title: CANCEL_STRING(), style: .cancel, handler: nil)
        alert.addAction(destroyAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
