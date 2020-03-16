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

-(void)ty_addItem:(TYUploadItem *)item;

@end

NS_ASSUME_NONNULL_END
