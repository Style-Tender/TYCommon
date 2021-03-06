//
//  TYUploadManager.m
//  AFNetworking
//
//  Created by Dou Guangzheng on 2020/3/16.
//

#import "TYUploadManager.h"
#import "AFNetworking.h"

//自定义打印内容
#ifdef DEBUG
#define TYLog(...) NSLog(__VA_ARGS__);
#else
#define TYLog(...) ;
#endif

@interface TYUploadManager ()

@property (nonatomic,strong) NSMutableArray<TYUploadItem *> *requests;

@end

@implementation TYUploadManager

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initConfig];
    }
    return self;
}

-(void)initConfig{
    _requests = [NSMutableArray array];
}

///添加上传元素
-(void)ty_addItem:(TYUploadItem *)item{
    [_requests addObject:item];
}
///开始上传任务
-(void)ty_startWithUrl:(NSString *)url progress:(void(^)(int index,NSProgress *uploadProgress))progress success:(void(^)(int index,id responseObject))success fail:(void(^)(int index,NSError *error))fail {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //创建串行队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    //开始
    dispatch_async(queue, ^{
        //创建信号量并初始化总量为1
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        
        TYLog(@"-----开始上传-----");
        
        for (int i = 0; i < self.requests.count; i++) {
            TYUploadItem *item = self.requests[i];
            
            [manager POST:url parameters:item.params headers:item.headers constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                [formData appendPartWithFileData:item.fileData name:item.name fileName:item.fileName mimeType:item.mimeType];
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                TYLog(@"正在上传-----%d,当前上传进度 %lld,总长度 %lld,占比%f,描述%@",i,uploadProgress.completedUnitCount,uploadProgress.totalUnitCount,uploadProgress.fractionCompleted,uploadProgress.localizedDescription);
                if(progress){
                    progress(i,uploadProgress);
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                TYLog(@"上传成功-----%d,结果%@",i,responseObject);
                if(success){
                    success(i,responseObject);
                }
                dispatch_semaphore_signal(semaphore);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                TYLog(@"上传失败-----%d,结果%@",i,error.localizedDescription);
                if(error){
                    fail(i,error);
                }
                dispatch_semaphore_signal(semaphore);
            }];
            // 加锁
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        }
        
        TYLog(@"-----上传结束-----");
    });
}

@end
