//
//  TYUploadItem.h
//  AFNetworking
//
//  Created by Dou Guangzheng on 2020/3/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYUploadItem : NSObject

@property (nonatomic,strong) UIImage *image;
@property (nonatomic,copy) NSString *videoFilePath;


@property (nonatomic,strong) NSDictionary *params;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *fileName;
@property (nonatomic,copy) NSString *mimeType;

@property (nonatomic,strong) NSData *fileData;

@end

NS_ASSUME_NONNULL_END
