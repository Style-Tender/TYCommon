//
//  TYHttpHelper.m
//  ELife
//
//  Created by heimou on 2019/12/26.
//  Copyright © 2019 heimou. All rights reserved.
//

#import "TYHttpHelper.h"
#import "AFNetworking.h"

//自定义打印内容
#ifdef DEBUG
#define TYLog(...) NSLog(__VA_ARGS__);
#else
#define TYLog(...) ;
#endif

@implementation TYHttpHelper

#pragma mark - GET请求
+(NSURLSessionDataTask *)GET:(NSString *)baseUrl
                  parameters:(NSDictionary *)params
                      header:(nullable NSDictionary <NSString *, NSString *> *) header
                     success:(void(^)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)) success
                     failure:(void(^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)) fail
                    complete:(void(^)(BOOL isSuccess))complete{
    
    TYLog(@"GET------>>>>");
    TYLog(@"URL:%@",baseUrl);
    TYLog(@"PARAMS:%@",params);
    TYLog(@"HEADER:%@",header);
    
    return [[self shareManager] GET:baseUrl parameters:params headers:header progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        TYLog(@"GET HTTP OK<<<<------%ld",((NSHTTPURLResponse *)task.response).statusCode);
        TYLog(@"URL:%@ \n 返回:",task.response.URL);
        TYLog(@"DATA:%@",responseObject);
        
        if(success)
            success(task,responseObject);
        if(complete)
            complete(YES);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        TYLog(@"GET HTTP ERROR<<<<------%ld",((NSHTTPURLResponse *)task.response).statusCode);
        TYLog(@"URL:%@",task.response.URL);
        TYLog(@"ERROR:%ld,%@",(long)error.code,error.localizedDescription);
        
        if(fail)
            fail(task,error);
        if(complete)
            complete(NO);
    }];
}

#pragma mark - POST方法
+(NSURLSessionDataTask *)POST:(NSString *)baseUrl
                   parameters:(NSDictionary *)params
                       header:(nullable NSDictionary <NSString *, NSString *> *) header
                      success:(void(^)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)) success
                      failure:(void(^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)) fail
                     complete:(void(^)(BOOL isSuccess))complete{
    TYLog(@"POST------>>>>");
    TYLog(@"URL:%@",baseUrl);
    TYLog(@"PARAMS:%@",params);
    TYLog(@"HEADER:%@",header);
    
    return [[self shareManager] POST:baseUrl parameters:params headers:header progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        TYLog(@"POST HTTP OK<<<<------%ld",((NSHTTPURLResponse *)task.response).statusCode);
        TYLog(@"URL:%@ \n 返回:",task.response.URL);
        TYLog(@"DATA:%@",responseObject);
        
        if(success)
            success(task,responseObject);
        if(complete)
            complete(YES);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        TYLog(@"POST HTTP ERROR<<<<------%ld",((NSHTTPURLResponse *)task.response).statusCode);
        TYLog(@"URL:%@",task.response.URL);
        TYLog(@"ERROR:%ld,%@",(long)error.code,error.localizedDescription);
        
        if(fail)
            fail(task,error);
        if(complete)
            complete(NO);
    }];
}

#pragma mark - PUT方法
+(NSURLSessionDataTask *)PUT:(NSString *)baseUrl
                   parameters:(NSDictionary *)params
                       header:(nullable NSDictionary <NSString *, NSString *> *) header
                      success:(void(^)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)) success
                      failure:(void(^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)) fail
                     complete:(void(^)(BOOL isSuccess))complete{
    TYLog(@"PUT------>>>>");
    TYLog(@"URL:%@",baseUrl);
    TYLog(@"PARAMS:%@",params);
    TYLog(@"HEADER:%@",header);
    
    return [[self shareManager] PUT:baseUrl parameters:params headers:header success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        TYLog(@"PUT HTTP OK<<<<------%ld",((NSHTTPURLResponse *)task.response).statusCode);
        TYLog(@"URL:%@ \n 返回:",task.response.URL);
        TYLog(@"DATA:%@",responseObject);
        
        if(success)
            success(task,responseObject);
        if(complete)
            complete(YES);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        TYLog(@"PUT HTTP ERROR<<<<------%ld",((NSHTTPURLResponse *)task.response).statusCode);
        TYLog(@"URL:%@",task.response.URL);
        TYLog(@"ERROR:%ld,%@",(long)error.code,error.localizedDescription);
        
        if(fail)
            fail(task,error);
        if(complete)
            complete(NO);
    }];
}

#pragma mark - DELETE方法
+(NSURLSessionDataTask *)DELETE:(NSString *)baseUrl parameters:(nullable NSDictionary *)params header:(nullable NSDictionary <NSString *,NSString *> *)headers success:(void(^)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)) success
                        failure:(void(^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)) fail
                       complete:(void(^)(BOOL isSuccess))complete{
    TYLog(@"DELETE------>>>>");
    TYLog(@"URL:%@",baseUrl);
    TYLog(@"PARAMS:%@",params);
    TYLog(@"HEADER:%@",headers);
    
    return [[self shareManager] DELETE:baseUrl parameters:params headers:headers success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        TYLog(@"DELETE HTTP OK<<<<------%ld",((NSHTTPURLResponse *)task.response).statusCode);
        TYLog(@"URL:%@ \n 返回:",task.response.URL);
        TYLog(@"DATA:%@",responseObject);
        if(success)
            success(task,responseObject);
        if(complete)
            complete(YES);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        TYLog(@"DELETE HTTP ERROR<<<<------%ld",((NSHTTPURLResponse *)task.response).statusCode);
        TYLog(@"URL:%@",task.response.URL);
        TYLog(@"ERROR:%ld,%@",(long)error.code,error.localizedDescription);
        
        if(fail)
            fail(task,error);
        if(complete)
            complete(NO);
    }];
}

#pragma mark - 单例控制
+(instancetype)shareHelper{
    TYHttpHelper *instance = [[self alloc]init];
    return instance;
}
static TYHttpHelper *_instance;
static AFHTTPSessionManager *_manager;

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:zone]init];
    });
    return _instance;
}
-(id)copyWithZone:(NSZone *)zone{
    return _instance;
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}
+(AFHTTPSessionManager *)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer.timeoutInterval = 15;
        _manager.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObjects:@"GET", @"HEAD", nil];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", @"null",nil];
    });
    return _manager;
}

@end
