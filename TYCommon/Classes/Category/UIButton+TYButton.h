//
//  UIButton+TYButton.h
//  TYLib
//
//  Created by 田宇 on 2015/4/25.
//  Copyright © 2015年 mr_tian. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, TYButtonLocation) {
    TYButtonLocationTitleTop  = 0,
    TYButtonLocationTitleLeft     = 1,
    TYButtonLocationTitleBottom  = 2,
};

typedef void(^ButtonBlock)(UIButton* btn);

@interface UIButton (TYButton)

/**
 修改按钮图片、title位置，间距
 @param location 图片、title位置
 @param margin 间距
 */
-(void)ty_changeTitleLocation:(TYButtonLocation) location withMargin:(float)margin;

/**
 *  button 添加点击事件
 *  @param block block
 */
- (void)ty_addAction:(ButtonBlock)block;

/**
 *  button 添加事件
 *  @param block block
 *  @param controlEvents 点击的方式
 */
- (void)ty_addAction:(ButtonBlock)block forControlEvents:(UIControlEvents)controlEvents;


/**
 创建按钮
 */
+ (UIButton *)ty_buttonWithTitle:(nullable NSString *)title textColor:(nullable UIColor *)textColor font:(nullable UIFont *)font;

@end
NS_ASSUME_NONNULL_END
