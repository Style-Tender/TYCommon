//
//  TYNavigationBarManager.h
//  ELife
//
//  Created by heimou on 2019/12/30.
//  Copyright © 2019 heimou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYNavigationBarManager : NSObject

///设置类前缀，不是此前缀的会被忽略
+ (void)ty_setClassPrefix:(NSString *)prefix;

///默认导航栏背景颜色
+ (void)ty_setDefaultNavigationBarBackgroundColor:(UIColor *)color;

///默认导航栏的Tint颜色
+ (void)ty_setDefaultNavigationBarTintColor:(UIColor *)color;

///默认导航栏标题的字体颜色
+ (void)ty_setDefaultNavigationBarTitleTextColor:(UIColor *)color;

///默认导航栏背景透明度
+ (void)ty_setDefaultNavigationBarBackgroundAlpha:(CGFloat)alpha;

///默认导航栏横线的隐藏
+ (void)ty_setDefaultNavigationBarShadowImageHidden:(BOOL)hidden;

@end

#pragma mark - UIViewController + TYNavigationBar
@interface UIViewController (TYNavigationBar)

///设置导航栏背景图片
-(void)ty_setNavigationBarBackgroundImage:(UIImage *)image;

///设置导航栏背景颜色
- (void)ty_setNavigationBarBackgroundColor:(UIColor *)color;

///设置导航栏的Tint颜色
- (void)ty_setNavigationBarTintColor:(UIColor *)color;

///设置导航栏标题的字体颜色
- (void)ty_setNavigationBarTitleTextColor:(UIColor *)color;

///设置导航栏背景透明度
- (void)ty_setNavigationBarBackgroundAlpha:(CGFloat)alpha;

///设置导航栏横线的隐藏
-(void)ty_setNavigationBarShadowImageHidden:(BOOL)hidden;

///设置导航栏隐藏
- (void)ty_setNavigationBarHidden:(BOOL)hidden;

///添加自控制器-使用父控制器的导航栏属性
- (void)ty_addChildViewController:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
