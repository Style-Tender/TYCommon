//
//  TYConfig.h
//  ELife
//
//  Created by heimou on 2020/2/28.
//  Copyright © 2020 heimou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYConfig : NSObject<NSCopying,NSMutableCopying>

+(instancetype)curConfig;

@property (nonatomic,assign) CGFloat uiSizeWidth;

@end

NS_ASSUME_NONNULL_END
