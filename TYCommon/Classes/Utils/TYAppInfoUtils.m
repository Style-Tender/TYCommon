//
//  TYAppInfoUtils.m
//  ELife
//
//  Created by 田宇 on 2020/2/11.
//  Copyright © 2020 heimou. All rights reserved.
//

#import "TYAppInfoUtils.h"

@implementation TYAppInfoUtils

#pragma mark - 获取APP名称
+(NSString *)ty_getAPPName{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleName"];
    return app_Name;
}

#pragma mark - 获取APP当前版本号
+(NSString *)ty_getAPPVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

#pragma mark - 获取appIconName
+(NSString*)ty_getAPPIconName{
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    NSString *icon = [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    return icon;
}

#pragma mark - 跳转App Store信息页面
+(void)ty_jump2AppStore_APPinfoWithAppid:(NSString *)appId{
    NSString *url = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@",appId];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
}

#pragma mark - 跳转App Store评论页面
+(void)ty_jump2AppStore_APPCommentWithAppid:(NSString *)appId{
    NSString * url = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",appId];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
}

@end
