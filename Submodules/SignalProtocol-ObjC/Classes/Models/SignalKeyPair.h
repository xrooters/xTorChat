//
//  SignalKeyPair.h
//  Pods
//
//  Created byTopStar on 6/30/16.
//
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN
@interface SignalKeyPair : NSObject <NSSecureCoding>

@property (nonatomic, strong, readonly) NSData *publicKey;
@property (nonatomic, strong, readonly) NSData *privateKey;

- (nullable instancetype) initWithPublicKey:(NSData*)publicKey
                                 privateKey:(NSData*)privateKey
                                      error:(NSError**)error;

@end
NS_ASSUME_NONNULL_END
