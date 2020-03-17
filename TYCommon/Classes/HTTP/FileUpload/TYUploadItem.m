//
//  TYUploadItem.m
//  AFNetworking
//
//  Created by Dou Guangzheng on 2020/3/16.
//

#import "TYUploadItem.h"

@implementation TYUploadItem

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initConfig];
    }
    return self;
}

-(void)initConfig{
    self.params = @{};
    self.headers = @{};
    self.name = @"";
    self.fileName = @"";
    self.mimeType = @"";
}

- (void)setVideoFilePath:(NSString *)videoFilePath{
    _videoFilePath = videoFilePath;
    
    self.fileData = [NSData dataWithContentsOfFile:videoFilePath];
    self.mimeType = @"video/mp4";
}

-(void)setImage:(UIImage *)image{
    _image = image;
    
    self.fileData = UIImagePNGRepresentation(image);
    self.mimeType = @"image/png";
}
@end
