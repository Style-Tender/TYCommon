//
//  TYUploadManager.h
//  AFNetworking
//
//  Created by Dou Guangzheng on 2020/3/16.
//

#import <Foundation/Foundation.h>
#import "TYUploadItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface TYUploadManager : NSObject

///添加上传元素
-(void)ty_addItem:(TYUploadItem *)item;

///开始上传任务
-(void)ty_startWithUrl:(NSString *)url progress:(void(^)(int index,NSProgress *uploadProgress))progress success:(void(^)(int index,id responseObject))success fail:(void(^)(int index,NSError *error))fail;

@end

NS_ASSUME_NONNULL_END
