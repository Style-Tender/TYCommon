//
//  UITextField+TYTextField.h
//  AFNetworking
//
//  Created by Dou Guangzheng on 2020/4/21.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (TYTextField)

///设置占位
-(void)ty_setPlaceholder:(NSString *)text withColor:(nullable UIColor *)color;

@end

NS_ASSUME_NONNULL_END
