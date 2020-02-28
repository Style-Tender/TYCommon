//
//  UIViewController+TYController.m
//  ELife
//
//  Created by heimou on 2019/12/26.
//  Copyright © 2019 heimou. All rights reserved.
//

#import "UIViewController+TYController.h"

@implementation UIViewController (TYController)

#pragma mark - 发送通知
-(void)ty_postNotificationWithName:(NSString *)name andParams:(nullable NSDictionary *)params{
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil userInfo:params];
}

#pragma mark - 注册通知
-(void)ty_registerNotificationName:(NSString *)name andSEL:(SEL)action{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:action name:name object:nil];
}

#pragma mark - 模态出半透明的控制器
-(void)ty_presentTransparentViewController:(nonnull UIViewController *)viewController animated:(BOOL)animate completion:(nullable void(^)(void))comlete{
    //设置ViewController的背景颜色及透明度
    viewController.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    //设置ViewController的模态模式，即ViewController的显示方式
    viewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    [self presentViewController:viewController animated:animate completion:comlete];
}

#pragma mark - pop自己
- (void)ty_popSelf{
    if (self.navigationController.viewControllers.count >= 3) {
        NSMutableArray<UIViewController *> *vcs = self.navigationController.viewControllers.mutableCopy;
        [vcs removeObject:self];
        
        [self.navigationController setViewControllers:vcs animated:NO];
    }
}

@end
