//
//  TYRawHttpHelper.h
//  ELife
//
//  Created by 田宇 on 2020/2/11.
//  Copyright © 2020 heimou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYRawHttpHelper : NSObject<NSCopying,NSMutableCopying>

///GET方法
+(NSURLSessionDataTask *)GET:(NSString *)baseUrl
                  parameters:(NSDictionary *)params
                      header:(nullable NSDictionary <NSString *, NSString *> *) header
                     success:(void(^)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)) success
                     failure:(void(^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)) fail
                    complete:(void(^)(BOOL isSuccess))complete;

///POST方法
+(NSURLSessionDataTask *)POST:(NSString *)baseUrl
                   parameters:(NSDictionary *)params
                       header:(nullable NSDictionary <NSString *, NSString *> *) header
                      success:(void(^)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)) success
                      failure:(void(^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)) fail
                     complete:(void(^)(BOOL isSuccess))complete;

///PUT方法
+(NSURLSessionDataTask *)PUT:(NSString *)baseUrl
                  parameters:(NSDictionary *)params
                      header:(nullable NSDictionary <NSString *, NSString *> *) header
                     success:(void(^)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)) success
                     failure:(void(^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)) fail
                    complete:(void(^)(BOOL isSuccess))complete;


///DELETE方法
+(NSURLSessionDataTask *)DELETE:(NSString *)baseUrl
                     parameters:(nullable NSDictionary *)params
                        header:(nullable NSDictionary <NSString *,NSString *> *)headers
                        success:(void(^)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)) success
                        failure:(void(^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)) fail
                       complete:(void(^)(BOOL isSuccess))complete;

@end

NS_ASSUME_NONNULL_END
