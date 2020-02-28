//
//  UILabel+TYLabel.h
//  Test
//
//  Created by 田宇 on 2018/10/23.
//  Copyright © 2018年 blackvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TYLabel)

+(instancetype)ty_labelWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;

-(void)ty_setLineHeight:(CGFloat)lineHeight;
@end
