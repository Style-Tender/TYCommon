//
//  TYAppInfoUtils.h
//  ELife
//
//  Created by 田宇 on 2020/2/11.
//  Copyright © 2020 heimou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYAppInfoUtils : NSObject

/**
 获取APP名称
 */
+(NSString *)ty_getAPPName;

/**
 获取appd版本号
 */
+(NSString *)ty_getAPPVersion;

///获取appIconName
+(NSString*)ty_getAPPIconName;

/**
 跳转AppStore详情页面
 */
+(void)ty_jump2AppStore_APPinfoWithAppid:(NSString *)appId;

/**
 跳转AppStore打分页面
 */
+(void)ty_jump2AppStore_APPCommentWithAppid:(NSString *)appId;

@end

NS_ASSUME_NONNULL_END
