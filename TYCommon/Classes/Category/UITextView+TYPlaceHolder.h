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

- (void)ty_setPlaceholderWithText:(NSString *)placeholder Color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
