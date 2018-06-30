//
//  EnablePushViewController.swift
//  xTorChat
//
//  Created byTopStar on 2/4/16.
//  Copyright © 2016TopStar. All rights reserved.
//

import UIKit
import OTRAssets
import MBProgressHUD

open class EnablePushViewController: UIViewController {
    
    /** Set this if you want to show OTRInviteViewController after push registration */
    @objc open var account: OTRAccount?
    fileprivate var userLaunchedToSettings: Bool = false
    private var hud: MBProgressHUD?

    @IBOutlet weak var enablePushButton: UIButton?
    @IBOutlet weak var textView: UITextView?
    @IBOutlet weak var skipButton: UIButton?
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
        self.navigationItem.setHidesBackButton(false, animated: animated)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: animated)
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hud = MBProgressHUD.showAdded(to: view, animated: true)
        PushController.setPushPreference(.enabled)
        PushController.registerForPushNotifications()
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func enablePushPressed(_ sender: AnyObject) {
        hud = MBProgressHUD.showAdded(to: view, animated: true)
        PushController.setPushPreference(.enabled)
        PushController.registerForPushNotifications()
    }

     func enablePush(){        
        PushController.setPushPreference(.enabled)
        PushController.registerForPushNotifications()
    }
    @IBAction func skipButtonPressed(_ sender: AnyObject) {
        PushController.setPushPreference(.disabled)
    }
    
}
