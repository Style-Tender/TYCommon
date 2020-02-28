//
//  UIColor+TYColor.h
//  ELife
//
//  Created by heimou on 2019/12/26.
//  Copyright © 2019 heimou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define RGB(r,g,b) [UIColor ty_colorWithRed:r green:g blue:b alpha:1]
#define RGBA(r,g,b,a) [UIColor ty_colorWithRed:r green:g blue:b alpha:a]

#define rgb(r,g,b) [UIColor ty_colorWithRed:r green:g blue:b alpha:1]
#define rgba(r,g,b,a) [UIColor ty_colorWithRed:r green:g blue:b alpha:a]

@interface UIColor (TYColor)

///颜色转换：（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *)ty_colorWithHexString: (NSString *)color;

///颜色转换：RGBA色号
+ (UIColor *)ty_colorWithRed:(float)r green:(float)g blue:(float)b alpha:(float)a;

@end

NS_ASSUME_NONNULL_END
