//
//  UITextView+TYPlaceHolder.m
//  ELife
//
//  Created by 田宇 on 2020/2/11.
//  Copyright © 2020 heimou. All rights reserved.
//

#import "UITextView+TYPlaceHolder.h"
#import <objc/runtime.h>
#import "UIView+TYView.h"

static const char *kPlaceholderKey = "kPlaceholderKey";
static const char *kPlaceholderLabelKey = "kPlaceholderLabelKey";

@interface UITextView (PlaceholderLabel)<UITextViewDelegate>

@property (nonatomic, strong) UILabel *placeholderLabel;

@end


@implementation UITextView (TYPlaceHolder)

+ (void)load {
    
    // 获取类方法 class_getClassMethod
    // 获取对象方法 class_getInstanceMethod
    
    Method setFontMethod = class_getInstanceMethod(self, @selector(setFont:));
    Method ty_setFontMethod = class_getInstanceMethod(self, @selector(ty_setFont:));
    
    // 交换方法的实现
    method_exchangeImplementations(setFontMethod, ty_setFontMethod);
}

- (void)ty_setFont:(UIFont *)font{
    //调用原方法 setFont:
    [self ty_setFont:font];
    //设置占位字符串的font
    if (self.placeholderLabel != nil) {
        self.placeholderLabel.font = font;
    }
}

- (UILabel *)placeholderLabel{
    return objc_getAssociatedObject(self, kPlaceholderLabelKey);
}

- (void)setPlaceholderLabel:(UILabel *)placeholderLabel{
    objc_setAssociatedObject(self, kPlaceholderLabelKey, placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)placeholder{
    return objc_getAssociatedObject(self, kPlaceholderKey);
}

- (void)ty_setPlaceholderWithText:(NSString *)placeholder Color:(UIColor *)color{
    objc_setAssociatedObject(self, kPlaceholderKey, placeholder, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UILabel *label = [[UILabel alloc] init];
    label.text = placeholder;
    label.textColor = color;
    label.numberOfLines = 0;
    [label sizeToFit];
    [self addSubview:label];
    
    self.placeholderLabel = label;
    
    self.delegate = self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //5  7.75是实验后得出的完美位置，如有需求可以修改
    UIEdgeInsets insets = self.textContainerInset;
    
    self.placeholderLabel.ty_x = insets.left + 5;
    self.placeholderLabel.ty_y = insets.top - 2;
    
    [self.placeholderLabel sizeToFit];
}

- (void)textViewDidChange:(UITextView *)textView{
    self.placeholderLabel.hidden = !(self.text.length == 0);
}

@end
