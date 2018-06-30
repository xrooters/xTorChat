//
//  SignalKeyHelper_Internal.h
//  Pods
//
//  Created byTopStar on 6/29/16.
//
//

#import "SignalKeyHelper.h"

@interface SignalKeyHelper ()

- (SignalSignedPreKey*)generateSignedPreKeyWithIdentity:(SignalIdentityKeyPair*)identityKeyPair
                                         signedPreKeyId:(uint32_t)signedPreKeyId
                                              timestamp:(NSDate*)timestamp
                                                  error:(NSError**)error;

@end
