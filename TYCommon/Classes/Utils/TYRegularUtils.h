//
//  TYRegularUtils.h
//  ELife
//
//  Created by heimou on 2019/12/30.
//  Copyright © 2019 heimou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYRegularUtils : NSObject

///SHA1加密
+(NSString *)ty_sha1:(NSString *)value;

///判断是否为手机号
+(BOOL)ty_isPhoneNumer:(NSString *)phone;

///限制手机号长度
+(void)limitPhone:(UITextField *)field;

///限制验证码长度
+(void)limitSMSCode:(UITextField *)field;

///限制密码长度
+(void)limitPassword:(UITextField *)field;

///限制身份证长度
+(void)limitIDCard:(UITextField *)field;

@end

NS_ASSUME_NONNULL_END
