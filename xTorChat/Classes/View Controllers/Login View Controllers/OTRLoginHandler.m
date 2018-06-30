//
//  OTRLoginHandler.m
//  xTorChat
//
//  Created by David Chiles on 6/18/15.
//  Copyright (c) 2015TopStar. All rights reserved.
//

#import "OTRLoginHandler.h"
#import "OTRXMPPLoginHandler.h"
#import "OTRGoolgeOAuthLoginHandler.h"
#import "OTRAccount.h"
#import "OTRXMPPAccount.h"
#import "OTRGoogleOAuthXMPPAccount.h"

@implementation OTRLoginHandler

+ (id<OTRBaseLoginViewControllerHandlerProtocol>)loginHandlerForAccount:(OTRAccount *)account
{
    id<OTRBaseLoginViewControllerHandlerProtocol>loginHandler = nil;
    if (account.accountType == OTRAccountTypeJabber || account.accountType == OTRAccountTypeXMPPTor) {
        loginHandler = [[OTRXMPPLoginHandler alloc] init];
    }
    NSParameterAssert(loginHandler != nil);
    return loginHandler;
}

@end
