//
//  UIImage+TYImage.h
//  TYLib
//
//  Created by 田宇 on 2015/10/16.
//  Copyright © 2015年 mr_tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TYImage)

/**
 原图
 */
+(UIImage *)ty_originalImageWithName:(NSString *)imageName;

+(UIImage *)ty_imageFromColor:(UIColor *)color andSize:(CGSize)size;

-(UIImage *)ty_roundImage;

@end
