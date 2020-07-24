//
//  TYPhoneUtils.m
//  ELife
//
//  Created by 田宇 on 2020/2/11.
//  Copyright © 2020 heimou. All rights reserved.
//

#import "TYPhoneUtils.h"
#import <sys/utsname.h>

@implementation TYPhoneUtils

///拨打电话
+(void)ty_call:(NSString *)phone{
    NSString * str = [NSString stringWithFormat:@"tel:%@",phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:@{} completionHandler:nil];
}

///获取手机型号
+(NSString *)ty_getPhoneModel{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    NSString *path = [[NSBundle bundleForClass:[TYPhoneUtils class]] pathForResource:@"DeviceModel" ofType:@"plist"];
    NSDictionary *devices = [NSDictionary dictionaryWithContentsOfFile:path];
    
    if([devices.allKeys containsObject:deviceModel]){
        return devices[deviceModel];
    }else{
        return deviceModel;
    }
}

@end
