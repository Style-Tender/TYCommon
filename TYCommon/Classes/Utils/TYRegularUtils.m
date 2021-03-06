//
//  TYRegularUtils.m
//  ELife
//
//  Created by heimou on 2019/12/30.
//  Copyright © 2019 heimou. All rights reserved.
//

#import "TYRegularUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation TYRegularUtils

///SHA1加密
+(NSString *)ty_sha1:(NSString *)value{
    const char *cstr = [value cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:value.length];
    //使用对应的CC_SHA1,CC_SHA256,CC_SHA384,CC_SHA512的长度分别是20,32,48,64
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    //使用对应的CC_SHA256,CC_SHA384,CC_SHA512
    CC_SHA1(data.bytes,(unsigned int)data.length, digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++){
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

///MD5加密
+(NSString *)ty_md5:(NSString *)str{
    const char *cStr = [str UTF8String];
    unsigned char digst[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digst);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x",digst[i]];
    }
    return output;
}

///判断是否为手机号
+(BOOL)ty_isPhoneNumer:(NSString *)phone{
    NSString *regex = @"^[1][3456789]\\d{9}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isValid = [predicate evaluateWithObject:phone];
    
    return isValid;
}

///判断是否为邮箱
+(BOOL)ty_isEmail:(NSString *)email{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isValid = [predicate evaluateWithObject:email];
    
    return isValid;
}
///限制手机号长度
+(void)limitPhone:(UITextField *)field{
    NSString *value = field.text;
    if(value.length > 11){
        field.text = [value substringToIndex:11];
    }
}

///限制验证码长度
+(void)limitSMSCode:(UITextField *)field{
    NSString *value = field.text;
    if(value.length > 4){
        field.text = [value substringToIndex:4];
    }
}

///限制密码长度
+(void)limitPassword:(UITextField *)field{
    NSString *value = field.text;
    if(value.length > 32){
        field.text = [value substringToIndex:32];
    }
}

///限制身份证长度
+(void)limitIDCard:(UITextField *)field{
    NSString *value = field.text;
    if(value.length > 18){
        field.text = [value substringToIndex:18];
    }
}

@end
