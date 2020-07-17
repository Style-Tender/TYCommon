//
//  TYAppDelegate.m
//  TYCommon
//
//  Created by 785072254@qq.com on 02/28/2020.
//  Copyright (c) 2020 785072254@qq.com. All rights reserved.
//

#import "TYAppDelegate.h"
#import "TYViewController.h"
#import <TYNavigationBarManager.h>

@implementation TYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    _window = [[UIWindow alloc]initWithFrame:UIScreen.mainScreen.bounds];
    
    //初始化
    [TYNavigationBarManager ty_setDefaultNavigationBarShadowImageHidden:YES];
    
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[TYViewController new]];
    _window.rootViewController = nav;
    
    [_window makeKeyAndVisible];
    return YES;
}


@end
