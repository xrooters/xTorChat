//
//  UIAlertController+xTorChatswift
//  xTorChatCore
//
//  Created byTopStar on 8/1/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

import UIKit
import OTRAssets

public extension UIAlertController {
    
    /** Returns a cert-pinning alert if needed */
    @objc public static func certificateWarningAlert(error: Error, saveHandler: @escaping (_ action: UIAlertAction) -> Void) -> UIAlertController? {
        let nsError = error as NSError
        guard let errorCode = OTRXMPPErrorCode(rawValue: nsError.code),
            errorCode == .sslError,
            let certData = nsError.userInfo[OTRXMPPSSLCertificateDataKey] as? Data,
            let hostname = nsError.userInfo[OTRXMPPSSLHostnameKey] as? String
           else {
            return nil
        }
        
       
        
        OTRCertificatePinning.addCertificateData(certData, withHostName: hostname)
        
        return nil
    }
}
