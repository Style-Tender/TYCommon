//
//  UIButton+TYButton.m
//  TYLib
//
//  Created by 田宇 on 2015/4/25.
//  Copyright © 2015年 mr_tian. All rights reserved.
//

#import "UIButton+TYButton.h"
#import <objc/runtime.h>

@implementation UIButton (TYButton)

-(void)ty_changeTitleLocation:(TYButtonLocation) location withMargin:(float)margin{    
    float imageW = self.imageView.intrinsicContentSize.width;
    float imageH = self.imageView.intrinsicContentSize.height;
    
    float titleW = self.titleLabel.intrinsicContentSize.width;
    float titleH = self.titleLabel.intrinsicContentSize.height;
    
    switch (location) {
        case TYButtonLocationTitleTop:
            //文字在上，图片在下(OK)
            self.titleEdgeInsets = UIEdgeInsetsMake(0,-imageW, (imageH + margin/2), 0);
            self.imageEdgeInsets = UIEdgeInsetsMake((titleH + margin/2), 0, 0, -titleW);
            break;
            
        case TYButtonLocationTitleLeft:
            //文字在左，图片在右(OK)
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageW + margin/2), 0, (imageW + margin/2));
            self.imageEdgeInsets =UIEdgeInsetsMake(0, (titleW + margin/2), 0, -(titleW + margin/2));
            break;
            
        case TYButtonLocationTitleBottom:
            //文字在下，图片在上(OK)
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageW, -(imageH + margin/2), 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(-(titleH + margin/2), 0, 0, -titleW);
            
            break;
    }
}

static char ActionTag;
/**
 *  button 添加点击事件 默认点击方式UIControlEventTouchUpInside
 *  @param block block
 */
- (void)ty_addAction:(ButtonBlock)block {
    [self ty_addAction:block forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  button 添加事件
 *  @param block block
 *  @param controlEvents 点击的方式
 */
- (void)ty_addAction:(ButtonBlock)block forControlEvents:(UIControlEvents)controlEvents {
    objc_setAssociatedObject(self, &ActionTag, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(action:) forControlEvents:controlEvents];
}

/**
 *  button 事件的响应方法
 *  @param sender sender
 */
- (void)action:(UIButton *)sender {
    ButtonBlock blockAction = (ButtonBlock)objc_getAssociatedObject(self, &ActionTag);
    if (blockAction) {
        blockAction(sender);
    }
}

#pragma mark - 创建按钮
+ (UIButton *)ty_buttonWithTitle:(nullable NSString *)title textColor:(nullable UIColor *)textColor font:(nullable UIFont *)font{
    UIButton *button = [[UIButton alloc]init];
    if(title){
        [button setTitle:title forState:UIControlStateNormal];
    }
    if(textColor){
        [button setTitleColor:textColor forState:UIControlStateNormal];
    }
    if(font){
        button.titleLabel.font = font;
    }
    return button;
}

@end
