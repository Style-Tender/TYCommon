//
//  NSString+TYString.h
//  ELife
//
//  Created by heimou on 2019/12/26.
//  Copyright © 2019 heimou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TYString)

-(BOOL)ty_isNotEmpty;

-(NSArray<NSString *> *)ty_componentsSeparatedByString:(NSString *)str;

- (NSString *)ty_covertToPinyin;

@end

@interface NSString (Code)

-(NSString *)ty_encode;

@end

@interface NSString (Size)

-(CGFloat)ty_heightOfFont:(UIFont *)font andMaxWidth:(CGFloat)width;

-(CGFloat)ty_widthOfFont:(UIFont *)font andMaxHeight:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
