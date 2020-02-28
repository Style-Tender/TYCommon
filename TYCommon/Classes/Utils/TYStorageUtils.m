//
//  TYStorageUtils.m
//  TYLib
//
//  Created by 田宇 on 2015/9/5.
//  Copyright © 2015年 mr_tian. All rights reserved.
//

#import "TYStorageUtils.h"

@implementation TYStorageUtils

#pragma mark - 存储NSInteger
+(void)ty_saveInteger:(NSInteger)number withKey:(nonnull NSString *)key{
    if(key!=nil && key.length > 0){
        [[NSUserDefaults standardUserDefaults] setInteger:number forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+(NSInteger)ty_integerForKey:(NSString *)key withDefalt:(NSInteger) defaultV{
    NSInteger result = defaultV;
    if(key!=nil && key.length > 0){
        result = [[NSUserDefaults standardUserDefaults] integerForKey:key];
    }
    return result;
}

#pragma mark - 对象存储
+(void)ty_saveObject:(nonnull id)obj withKey:(nonnull NSString *)key{
    if(obj != nil && key!=nil && key.length > 0){
        [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
+(id)ty_objectForKey:(nonnull NSString *)key{
    id obj = nil;
    if(key!=nil && key.length > 0){
        obj = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    }
    return obj;
}

#pragma mark - 清空所有key-value
+(void)ty_clear{
    NSDictionary* dict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for(id key in dict) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)ty_clearObjWithKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)ty_clearObjsWithOutKey:(NSString *)key{
    NSDictionary* dict = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for(id k in dict) {
        if(![key isEqualToString:k]){
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:k];
        }
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
