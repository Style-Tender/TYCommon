//
//  TYStorageUtils.h
//  TYLib
//
//  Created by 田宇 on 2015/9/5.
//  Copyright © 2015年 mr_tian. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface TYStorageUtils : NSObject

+(void)ty_saveInteger:(NSInteger)number withKey:( NSString *)key;
+(NSInteger)ty_integerForKey:(NSString *)key withDefalt:(NSInteger) defaultV;

+(void)ty_saveObject:(id)obj withKey:(NSString *)key;
+(id)ty_objectForKey:(NSString *)key;

+(void)ty_clear;
+(void)ty_clearObjWithKey:(NSString *)key;
+(void)ty_clearObjsWithOutKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
