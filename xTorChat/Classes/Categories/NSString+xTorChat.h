//
//  NSString+xTorChat.h
//  xTorChat
//
//  Created by David Chiles on 12/16/14.
//  Copyright (c) 2014TopStar. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN
@interface NSString (xTorChat)

- (nullable NSString *)otr_stringInitialsWithMaxCharacters:(NSUInteger)maxCharacters;

- (NSString *)otr_stringByRemovingNonEnglishCharacters;

/** Cleans up a JID from "user@example.com" -> "User" */
- (nullable NSString*) otr_displayName;

@end
NS_ASSUME_NONNULL_END
