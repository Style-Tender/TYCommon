//
//  UIImage+TYImage.m
//  TYLib
//
//  Created by 田宇 on 2015/10/16.
//  Copyright © 2015年 mr_tian. All rights reserved.
//

#import "UIImage+TYImage.h"

@implementation UIImage (TYImage)

+(UIImage *)ty_originalImageWithName:(NSString *)imageName{
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)ty_imageFromColor:(UIColor *)color andSize:(CGSize)size{
    CGRect rect = CGRectMake(0,0,size.width,size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

-(UIImage *)ty_roundImage{
    CGRect rect = CGRectMake(0,0,self.size.width,self.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [path addClip];
    
    [self drawInRect:rect];
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImg;
}

@end
