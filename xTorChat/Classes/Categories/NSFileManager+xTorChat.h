//
//  NSFileManager+xTorChat.h
//  xTorChat
//
//  Created by David Chiles on 5/19/15.
//  Copyright (c) 2015TopStar. All rights reserved.
//

@import Foundation;

@interface NSFileManager (xTorChat)


- (void)otr_enumerateFilesInDirectory:(NSString *)directory block:(void (^)(NSString *fullPath,BOOL *stop))enumerateBlock;
- (BOOL)otr_setFileProtection:(NSString *)fileProtection forFilesInDirectory:(NSString *)directory;
- (BOOL)otr_excudeFromBackUpFilesInDirectory:(NSString *)directory;

@end
