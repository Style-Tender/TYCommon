//
//  UITextField+TYTextField.m
//  AFNetworking
//
//  Created by Dou Guangzheng on 2020/4/21.
//

#import "UITextField+TYTextField.h"
#import "UIColor+TYColor.h"

@implementation UITextField (TYTextField)

///设置占位
-(void)ty_setPlaceholder:(NSString *)text withColor:(nullable UIColor *)color{
    UIColor *pColor = rgba(0, 0, 0, 0.29);
    if(color != nil){
        pColor = color;
    }
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName:pColor}];
}

@end
