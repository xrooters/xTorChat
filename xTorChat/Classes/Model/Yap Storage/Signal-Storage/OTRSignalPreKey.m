//
//  OTRSignalPreKey.m
//  xTorChat
//
//  Created by David Chiles on 7/26/16.
//  Copyright © 2016TopStar. All rights reserved.
//

#import "OTRSignalPreKey.h"

@implementation OTRSignalPreKey

- (nullable instancetype)initWithAccountKey:(NSString *)accountKey keyId:(uint32_t)keyId keyData:(NSData *)keyData {
    NSString *yapKey = [[self class] uniqueKeyForAccountKey:accountKey keyId:keyId];
    if (self = [super initWithUniqueId:yapKey]) {
        self.accountKey = accountKey;
        self.keyId = keyId;
        self.keyData = keyData;
    }
    return self;
}

+ (NSString *)uniqueKeyForAccountKey:(NSString *)accountKey keyId:(uint32_t)keyId
{
    return [NSString stringWithFormat:@"%@-%d",accountKey,keyId];
}

@end
