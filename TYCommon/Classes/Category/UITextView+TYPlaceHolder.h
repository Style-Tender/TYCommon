//
//  UITextView+TYPlaceHolder.h
//  ELife
//
//  Created by 田宇 on 2020/2/11.
//  Copyright © 2020 heimou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (TYPlaceHolder)

/// 占位符
@property (nonatomic, copy) NSString *ty_placeholder;
/// 占位符颜色
@property (nonatomic, strong) UIColor *ty_placeholderColor;

@end

NS_ASSUME_NONNULL_END
