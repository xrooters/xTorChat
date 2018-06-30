//
//  XMPPMessage+XEP_0313.h
//  XMPPFramework
//
//  Created byTopStar on 10/23/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

#import "XMPPMessage.h"

NS_ASSUME_NONNULL_BEGIN
@interface XMPPMessage (XEP_0313)
/** XEP-0313: MAM <result> element */
@property (nonatomic, nullable, readonly) NSXMLElement *mamResult;
@end
NS_ASSUME_NONNULL_END
