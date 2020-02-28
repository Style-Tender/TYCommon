//
//  UIView+TYView.m
//  ELife
//
//  Created by heimou on 2019/12/26.
//  Copyright © 2019 heimou. All rights reserved.
//

#import "UIView+TYView.h"
#import "TYConfig.h"

#define screenW [UIScreen mainScreen].bounds.size.width

@implementation UIView (TYView)

-(void)ty_addShadowWithColor:(nullable UIColor *)shadowColor andOffset:(CGSize)offset andRadius:(CGFloat) radius andOpacity:(CGFloat) opacity{
    if(shadowColor){
        self.layer.shadowColor = shadowColor.CGColor;
    }
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity =  opacity > 1 ? opacity / 255.0 : opacity;
}

-(void)ty_clipRoundWithViewSize:(CGSize)size andRoundWidth:(CGFloat)round byRoundingCorners:(UIRectCorner)corner{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    typedef NS_OPTIONS(NSUInteger, UIRectCorner) {
        UIRectCornerTopLeft     = 1 << 0,
        UIRectCornerTopRight    = 1 << 1,
        UIRectCornerBottomLeft  = 1 << 2,
        UIRectCornerBottomRight = 1 << 3,
        UIRectCornerAllCorners  = ~0UL
    };
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:CGSizeMake(round, round)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
}

+(CGFloat)getViewSize:(CGFloat) f{
    return f * (screenW / TYConfig.curConfig.uiSizeWidth);
}

-(void)ty_addActionWithTarget:(id)target action:(SEL)action{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
}

- (CGFloat)ty_width{
    return self.frame.size.width;
}

-(void)setTy_width:(CGFloat)ty_width{
    CGRect frame = self.frame;
    frame.size.width = ty_width;
    self.frame = frame;
}

- (CGFloat)ty_height{
    return self.frame.size.height;
}

- (void)setTy_height:(CGFloat)ty_height{
    CGRect frame = self.frame;
    frame.size.height = ty_height;
    self.frame = frame;
}

- (CGFloat)ty_x{
    return self.frame.origin.x;
}

-(void)setTy_x:(CGFloat)ty_x{
    CGRect frame = self.frame;
    frame.origin.x = ty_x;
    self.frame = frame;
}

- (CGFloat)ty_y{
    return self.frame.origin.y;
}

-(void)setTy_y:(CGFloat)ty_y{
    CGRect frame = self.frame;
    frame.origin.y = ty_y;
    self.frame = frame;
}

-(CGFloat)ty_centerX{
    return self.center.x;
}

- (void)setTy_centerX:(CGFloat)ty_centerX{
    CGPoint center = self.center;
    center.x = ty_centerX;
    self.center = center;
}

- (CGFloat)ty_centerY{
    return self.center.y;
}

- (void)setTy_centerY:(CGFloat)ty_centerY{
    CGPoint center = self.center;
    center.y = ty_centerY;
    self.center = center;
}

-(void)ty_setBackgroundImage:(UIImage *)image{
    self.layer.contents = (__bridge id _Nullable)image.CGImage;
}

///创建一个有背景色的View
+(UIView *)ty_ViewWithColor:(UIColor *)color{
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = color;
    return line;
}

@end
