//
//  UILabel+TYLabel.m
//  Test
//
//  Created by 田宇 on 2018/10/23.
//  Copyright © 2018年 blackvision. All rights reserved.
//

#import "UILabel+TYLabel.h"

@implementation UILabel (TYLabel)

+(instancetype)ty_labelWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font{
    UILabel *label = [[UILabel alloc]init];
    
    if(text){
        label.text = text;
    }
    if(textColor){
        label.textColor = textColor;
    }
    
    if(font){
        label.font = font;
    }
    return label;
}

-(void)ty_setLineHeight:(CGFloat)lineHeight{
    if(self.text){
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineSpacing = lineHeight - (self.font.lineHeight - self.font.pointSize);
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        [attributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
        self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:attributes];
    }
}

@end
