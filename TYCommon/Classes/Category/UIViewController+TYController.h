//
//  UIViewController+TYController.h
//  ELife
//
//  Created by heimou on 2019/12/26.
//  Copyright © 2019 heimou. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (TYController)

/**
 发送通知
 */
-(void)ty_postNotificationWithName:(NSString *)name andParams:(nullable NSDictionary *)params;

/**
 注册通知
 */
-(void)ty_registerNotificationName:(NSString *)name andSEL:(SEL)action;

/**
 pop自己
 */
- (void)ty_popSelf;

/**
 模态出半透明的控制器
 */
-(void)ty_presentTransparentViewController:(nonnull UIViewController *)viewController animated:(BOOL)animate completion:(nullable void(^)(void))comlete;

@end

NS_ASSUME_NONNULL_END
