//
//  UITextView+TYPlaceHolder.m
//  ELife
//
//  Created by 田宇 on 2020/2/11.
//  Copyright © 2020 heimou. All rights reserved.
//

#import "UITextView+TYPlaceHolder.h"
#import <objc/runtime.h>

/// 交换两个方法
static inline void exChangeSelector(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

static char kPlaceholderKey;

@interface UITextView ()
@property (nonatomic, readonly) UILabel *ex_placeholderLabel;
@end


@implementation UITextView (TYPlaceHolder)

+(void)load{
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        exChangeSelector(self.class, @selector(layoutSubviews), @selector(swizzled_layoutSubviews));
        exChangeSelector(self.class, @selector(setText:), @selector(swizzled_setText:));
    });
}
#pragma mark - swizzled
- (void)swizzled_layoutSubviews {
    if (self.ty_placeholder) {
        UIEdgeInsets textContainerInset = self.textContainerInset;
        CGFloat lineFragmentPadding = self.textContainer.lineFragmentPadding;
        CGFloat x = lineFragmentPadding + textContainerInset.left + self.layer.borderWidth;
        CGFloat y = textContainerInset.top + self.layer.borderWidth;
        CGFloat width = CGRectGetWidth(self.bounds) - x - textContainerInset.right - 2*self.layer.borderWidth;
        CGFloat height = [self.ex_placeholderLabel sizeThatFits:CGSizeMake(width, 0)].height;
        self.ex_placeholderLabel.frame = CGRectMake(x, y, width, height);
    }
    [self swizzled_layoutSubviews];
}
- (void)swizzled_setText:(NSString *)text{
    [self swizzled_setText:text];
    if (self.ty_placeholder) {
        [self updateex_placeholder];
    }
}
#pragma mark - associated
-(NSString *)ty_placeholder{
    return objc_getAssociatedObject(self, &kPlaceholderKey);
}
-(void)setTy_placeholder:(NSString *)ex_placeholder{
    objc_setAssociatedObject(self, &kPlaceholderKey, ex_placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updateex_placeholder];
}
-(UIColor *)ty_placeholderColor{
    return self.ex_placeholderLabel.textColor;
}
-(void)setTy_placeholderColor:(UIColor *)ex_placeholderColor{
    self.ex_placeholderLabel.textColor = ex_placeholderColor;
}

#pragma mark - update
- (void)updateex_placeholder{
    if (self.text.length) {
        [self.ex_placeholderLabel removeFromSuperview];
        return;
    }
    self.ex_placeholderLabel.font = self.font?self.font:self.cacutDefaultFont;
    self.ex_placeholderLabel.textAlignment = self.textAlignment;
    self.ex_placeholderLabel.text = self.ty_placeholder;
    [self insertSubview:self.ex_placeholderLabel atIndex:0];
}
#pragma mark - lazzing
-(UILabel *)ex_placeholderLabel{
    UILabel *ex_placeholderLab = objc_getAssociatedObject(self, @selector(ex_placeholderLabel));
    if (!ex_placeholderLab) {
        ex_placeholderLab = [[UILabel alloc] init];
        ex_placeholderLab.numberOfLines = 0;
        ex_placeholderLab.textColor = [UIColor lightGrayColor];
        objc_setAssociatedObject(self, @selector(ex_placeholderLabel), ex_placeholderLab, OBJC_ASSOCIATION_RETAIN);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateex_placeholder) name:UITextViewTextDidChangeNotification object:self];
    }
    return ex_placeholderLab;
}
- (UIFont *)cacutDefaultFont{
    static UIFont *font = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextView *textview = [[UITextView alloc] init];
        textview.text = @" ";
        font = textview.font;
    });
    return font;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
