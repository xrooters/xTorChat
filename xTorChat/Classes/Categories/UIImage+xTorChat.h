//
//  UIImage+xTorChat.h
//  xTorChat
//
//  Created by David Chiles on 10/27/14.
//  Copyright (c) 2014TopStar. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN
@interface UIImage (xTorChat)

+ (UIImage *)otr_imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

/** 
 Takes an image and square crops the image to shortest side.
 */
+ (UIImage *)otr_squareCropImage:(UIImage *)image;

/**
 Takes an image and square crops then scales down if neccessary to the max size allowed. If the cropped image is alredy less than the scaled size then nothing is done.
 */
+ (UIImage *)otr_prepareForAvatarUpload:(UIImage *)image maxSize:(CGFloat)size;

@end
NS_ASSUME_NONNULL_END
