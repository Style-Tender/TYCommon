//
//  TYConfig.m
//  ELife
//
//  Created by heimou on 2020/2/28.
//  Copyright © 2020 heimou. All rights reserved.
//

#import "TYConfig.h"

@implementation TYConfig

#pragma mark - 单例控制
+(instancetype)curConfig{
    TYConfig *instance = [[self alloc]init];
    return instance;
}

static TYConfig *_instance;

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:zone]init];
        [_instance initConfig];
    });
    return _instance;
}
-(id)copyWithZone:(NSZone *)zone{
    return _instance;
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}

#pragma mark - 默认设置
-(void)initConfig{
    self.uiSizeWidth = 375;
}

@end
