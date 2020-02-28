//
//  UIView+TYView.h
//  ELife
//
//  Created by heimou on 2019/12/26.
//  Copyright © 2019 heimou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TYView)

#define S(float) [UIView getViewSize:float]
#define F(float) [UIView getViewSize:float]

#define Size(w,h) CGSizeMake(S(w), S(h))

@property CGFloat ty_width;
@property CGFloat ty_height;
@property CGFloat ty_x;
@property CGFloat ty_y;
@property CGFloat ty_centerX;
@property CGFloat ty_centerY;

///添加阴影
-(void)ty_addShadowWithColor:(nullable UIColor *)shadowColor andOffset:(CGSize)offset andRadius:(CGFloat) radius andOpacity:(CGFloat) opacity;

///添加圆角
-(void)ty_clipRoundWithViewSize:(CGSize)size andRoundWidth:(CGFloat)round byRoundingCorners:(UIRectCorner)corner;

///获取屏幕适配后的长度
+(CGFloat)getViewSize:(CGFloat) f;

///添加点击事件
-(void)ty_addActionWithTarget:(id)target action:(SEL)action;

///设置背景图片
-(void)ty_setBackgroundImage:(UIImage *)image;

///创建一个有背景色的View
+(UIView *)ty_ViewWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
