//
//  TYPhoneUtils.h
//  ELife
//
//  Created by 田宇 on 2020/2/11.
//  Copyright © 2020 heimou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYPhoneUtils : NSObject

///拨打电话
+(void)ty_call:(NSString *)phone;

///获取手机型号
+(NSString *)ty_getPhoneModel;

@end

NS_ASSUME_NONNULL_END
