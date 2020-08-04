//
//  TYNavigationBarManager.m
//  ELife
//
//  Created by heimou on 2019/12/30.
//  Copyright © 2019 heimou. All rights reserved.
//

#import "TYNavigationBarManager.h"
#import <objc/runtime.h>

//==========================================================================
#pragma mark - TYNavigationBarManager
//==========================================================================

@implementation TYNavigationBarManager

static char kTYClassPresfixKey;
static char kTYDefaultBarBackgroundColorKey;
static char kTYDefaultNavigationBarTintColorKey;
static char kTYDefaultNavigationBarTitleTextColorKey;
static char kTYDefaultNavigationBarBackgroundAlphaKey;
static char kTYDefaultNavigationBarShadowImageHiddenKey;

///设置类前缀，不是此前缀的会被忽略
+ (void)ty_setClassPrefix:(NSString *)prefix{
    objc_setAssociatedObject(self, &kTYClassPresfixKey, prefix, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
+ (NSString *)classPresfix{
    NSString *str = objc_getAssociatedObject(self, &kTYClassPresfixKey);
    return str;
}

#pragma mark - 默认导航栏背景颜色
+ (void)ty_setDefaultNavigationBarBackgroundColor:(UIColor *)color{
    objc_setAssociatedObject(self, &kTYDefaultBarBackgroundColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+ (UIColor *)defaultBarBackgroundColor{
    UIColor *color = objc_getAssociatedObject(self, &kTYDefaultBarBackgroundColorKey);
    return color? color : [UIColor whiteColor];
}

#pragma mark - 默认导航栏的Tint颜色
+ (void)ty_setDefaultNavigationBarTintColor:(UIColor *)color{
    objc_setAssociatedObject(self, &kTYDefaultNavigationBarTintColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+ (UIColor *)defaultNavigationBarTintColor{
    UIColor *color = objc_getAssociatedObject(self, &kTYDefaultNavigationBarTintColorKey);
    return color? color : [UIColor blackColor];
}

#pragma mark - 默认导航栏标题的字体颜色
+ (void)ty_setDefaultNavigationBarTitleTextColor:(UIColor *)color{
    objc_setAssociatedObject(self, &kTYDefaultNavigationBarTitleTextColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+ (UIColor *)defaultNavigationBarTitleTextColor{
    UIColor *color = objc_getAssociatedObject(self, &kTYDefaultNavigationBarTitleTextColorKey);
    return color? color : [UIColor blackColor];
}

#pragma mark - 默认导航栏背景透明度
+ (void)ty_setDefaultNavigationBarBackgroundAlpha:(CGFloat)alpha{
    objc_setAssociatedObject(self, &kTYDefaultNavigationBarBackgroundAlphaKey, @(alpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+ (CGFloat)defaultNavigationBarBackgroundAlpha{
    id alpha = objc_getAssociatedObject(self, &kTYDefaultNavigationBarBackgroundAlphaKey);
    return alpha ? [alpha floatValue] : 1;
}

#pragma mark - 默认导航栏横线的隐藏
+ (void)ty_setDefaultNavigationBarShadowImageHidden:(BOOL)hidden{
    objc_setAssociatedObject(self, &kTYDefaultNavigationBarShadowImageHiddenKey, @(hidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+(BOOL)defaultNavigationBarShadowImageHidden{
    id hidden = objc_getAssociatedObject(self, &kTYDefaultNavigationBarShadowImageHiddenKey);
    return hidden ? [hidden boolValue] : NO;
}

@end


//==========================================================================
#pragma mark - UIViewController + TYNavigationBar
//==========================================================================
@implementation UIViewController (TYNavigationBar)

#pragma mark - 添加自控制器-使用父控制器的导航栏属性
- (void)ty_addChildViewController:(UIViewController *)viewController{
    [self addChildViewController:viewController];
    
    [viewController ty_setNavigationBarTitleTextColor:[self navigationBarBackgroundColor]];
    [viewController ty_setNavigationBarTintColor:[self navigationBarTintColor]];
    [viewController ty_setNavigationBarTitleTextColor:[self navigationBarTitleTextColor]];
    [viewController ty_setNavigationBarBackgroundAlpha:[self navigationBarBackgroundAlpha]];
    [viewController ty_setNavigationBarShadowImageHidden:[self navigationBarShadowImageHidden]];
    [viewController ty_setNavigationBarHidden:[self navigationBarShadowImageHidden]];
}

static char kTYBarBackgroundColorKey;
static char kTYNavigationBarTintColorKey;
static char kTYNavigationBarTitleTextColorKey;
static char kTYNavigationBarBackgroundAlphaKey;
static char kTYNavigationBarShadowImageHiddenKey;
static char kTYNavigationBarBackgroundImageKey;
static char kTYNavigationBarHiddenKey;
static char kTYNavigationBarOpaqueTranslucentKey;

#pragma mark - 背景图片
-(void)ty_setNavigationBarBackgroundImage:(UIImage *)image{
    objc_setAssociatedObject(self, &kTYNavigationBarBackgroundImageKey, image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updateNavigationBarBackgroundImage:image];
}

-(UIImage *)navigationBarBackgroundImage{
    UIImage *image = objc_getAssociatedObject(self, &kTYNavigationBarBackgroundImageKey);
    return image;
}

#pragma mark - 设置导航栏背景颜色
- (void)ty_setNavigationBarBackgroundColor:(UIColor *)color{
    objc_setAssociatedObject(self, &kTYBarBackgroundColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updateNavigationBarBackgroundColor:color];
}
- (UIColor *)navigationBarBackgroundColor{
    UIColor *color = objc_getAssociatedObject(self, &kTYBarBackgroundColorKey);
    return color? color : [TYNavigationBarManager defaultBarBackgroundColor];
}

#pragma mark - 设置导航栏的Tint颜色
- (void)ty_setNavigationBarTintColor:(UIColor *)color{
    objc_setAssociatedObject(self, &kTYNavigationBarTintColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updateNavigationBarTintColor:color];
}
- (UIColor *)navigationBarTintColor{
    UIColor *color = objc_getAssociatedObject(self, &kTYNavigationBarTintColorKey);
    return color? color : [TYNavigationBarManager defaultNavigationBarTintColor];
}

#pragma mark - 设置导航栏标题的字体颜色
- (void)ty_setNavigationBarTitleTextColor:(UIColor *)color{
    objc_setAssociatedObject(self, &kTYNavigationBarTitleTextColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updateNavigationBarTitleColor:color];
}
- (UIColor *)navigationBarTitleTextColor{
    UIColor *color = objc_getAssociatedObject(self, &kTYNavigationBarTitleTextColorKey);
    return color? color : [TYNavigationBarManager defaultNavigationBarTitleTextColor];
}

#pragma mark - 设置导航栏背景透明度
- (void)ty_setNavigationBarBackgroundAlpha:(CGFloat)alpha{
    objc_setAssociatedObject(self, &kTYNavigationBarBackgroundAlphaKey, @(alpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updateNavigationBarBackgroundAlpha:alpha];
}
- (CGFloat)navigationBarBackgroundAlpha{
    id alpha = objc_getAssociatedObject(self, &kTYNavigationBarBackgroundAlphaKey);
    return alpha ? [alpha floatValue] : [TYNavigationBarManager defaultNavigationBarBackgroundAlpha];
}

#pragma mark - 设置导航栏横线的隐藏
- (void)ty_setNavigationBarShadowImageHidden:(BOOL)hidden{
    objc_setAssociatedObject(self, &kTYNavigationBarShadowImageHiddenKey, @(hidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updateNavigationBarShadowImageHidden:hidden];
}
- (BOOL)navigationBarShadowImageHidden{
    id hidden = objc_getAssociatedObject(self, &kTYNavigationBarShadowImageHiddenKey);
    return hidden ? [hidden boolValue] : [TYNavigationBarManager defaultNavigationBarShadowImageHidden];
}

#pragma mark - 设置导航栏隐藏
- (void)ty_setNavigationBarHidden:(BOOL)hidden{
    objc_setAssociatedObject(self, &kTYNavigationBarHiddenKey, @(hidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.navigationController.navigationBar.hidden = hidden;
}
- (BOOL)navigationBarHidden{
    id hidden = objc_getAssociatedObject(self, &kTYNavigationBarHiddenKey);
    return hidden ? [hidden boolValue] : NO;
}

#pragma mark - 设置导航栏自带模糊效果
- (void)ty_setNavigationBarOpaqueTranslucent:(BOOL)translucent{
    objc_setAssociatedObject(self, &kTYNavigationBarOpaqueTranslucentKey, @(translucent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updateNavigationBarOpaqueTranslucent:translucent];
}

- (BOOL)navigationBarOpaqueTranslucent{
    id translucent = objc_getAssociatedObject(self, &kTYNavigationBarOpaqueTranslucentKey);
    return translucent ? [translucent boolValue] : YES;
}

#pragma mark - load时交换生命周期的方法
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL needSwizzleSelectors[1] = {
            @selector(viewWillAppear:)
        };
        
        for (int i = 0; i < 1;  i++) {
            SEL selector = needSwizzleSelectors[i];
            NSString *newSelectorStr = [NSString stringWithFormat:@"ty_%@", NSStringFromSelector(selector)];
            Method originMethod = class_getInstanceMethod(self, selector);
            Method swizzledMethod = class_getInstanceMethod(self, NSSelectorFromString(newSelectorStr));
            method_exchangeImplementations(originMethod, swizzledMethod);
        }
    });
}

- (void)ty_viewWillAppear:(BOOL)animated{
    [self ty_viewWillAppear:animated];
    if([TYNavigationBarManager classPresfix] != nil && ![NSStringFromClass([self class]) hasPrefix:[TYNavigationBarManager classPresfix]]){
        return;
    }
    
    if(self.navigationController != nil){
//        BOOL translucent = [self navigationBarOpaqueTranslucent];
//        [self updateNavigationBarOpaqueTranslucent:translucent];
    
        //导航栏是否隐藏
        [self.navigationController setNavigationBarHidden:[self navigationBarHidden] animated:animated];
        
        //如果导航栏不隐藏，继续设置
        if(![self navigationBarHidden]){
            //设置导航栏背景图片/颜色
            UIImage *image = [self navigationBarBackgroundImage];
            if(image){
                [self updateNavigationBarBackgroundImage:image];
            }else{
                [self updateNavigationBarBackgroundColor:[self navigationBarBackgroundColor]];
            }
            //设置导航栏的Tint颜色
            self.navigationController.navigationBar.tintColor = [self navigationBarTintColor];
            //设置导航栏标题的字体颜色
            [self updateNavigationBarTitleColor:[self navigationBarTitleTextColor]];
            //设置导航栏背景透明度
            [self updateNavigationBarBackgroundAlpha:[self navigationBarBackgroundAlpha]];
            //设置导航栏横线的隐藏
            [self updateNavigationBarShadowImageHidden:[self navigationBarShadowImageHidden]];
        }
    }
}

#pragma mark - 更新导航栏自带模糊效果
-(void)updateNavigationBarOpaqueTranslucent:(BOOL)translucent{
//    self.navigationController.navigationBar.translucent = [self navigationBarOpaqueTranslucent];
//    self.extendedLayoutIncludesOpaqueBars = !self.navigationController.navigationBar.translucent;
//    if(!translucent){
//        for (UIView *view in self.navigationController.navigationBar.subviews) {
//            if([view isKindOfClass:NSClassFromString(@"_UIBarBackground")]){
//                view.backgroundColor = UIColor.redColor;
//            }
//        }
//        
//    }
}

#pragma mark - 设置背景图片
-(void)updateNavigationBarBackgroundImage:(UIImage *)image{
    UIImage * navImg = [image resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:navImg forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - 设置导航栏背景颜色
- (void)updateNavigationBarBackgroundColor:(UIColor *)color{
//    self.navigationController.navigationBar.barTintColor = color;
    
    CGFloat alpha = [self navigationBarBackgroundAlpha];
    UIImage *image = [self ty_getImageWithColor:color andAlpha:alpha];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - 修改导航栏Tint颜色
- (void)updateNavigationBarTintColor:(UIColor *)color{
    self.navigationController.navigationBar.tintColor = [self navigationBarTintColor];
}

#pragma mark - 修改标题栏字体的颜色
- (void)updateNavigationBarTitleColor:(UIColor *)titleColor {
    NSDictionary *titleTextAttributes = [self.navigationController.navigationBar titleTextAttributes];
    if (titleTextAttributes == nil) {
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:titleColor};
        return;
    }
    NSMutableDictionary *newTitleTextAttributes = [titleTextAttributes mutableCopy];
    newTitleTextAttributes[NSForegroundColorAttributeName] = titleColor;
    self.navigationController.navigationBar.titleTextAttributes = newTitleTextAttributes;
}

#pragma mark - 修改导航栏背景透明度
- (void)updateNavigationBarBackgroundAlpha:(CGFloat)alpha{
//    self.navigationController.navigationBar.barTintColor = color;
    
    UIColor *color = [[self navigationBarBackgroundColor] colorWithAlphaComponent:alpha];
    UIImage *image = [self ty_getImageWithColor:color andAlpha:alpha];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - 修改分割线显示
- (void)updateNavigationBarShadowImageHidden:(BOOL)hidden{
    self.navigationController.navigationBar.shadowImage = hidden ? [UIImage new] : nil;
}

// 递归获取子视图
- (void)getSub:(UIView *)view andLevel:(int)level {
    NSArray *subviews = [view subviews];
    // 如果没有子视图就直接返回
    if ([subviews count] == 0) return;
    for (UIView *subview in subviews) {
        // 根据层级决定前面空格个数，来缩进显示
        NSString *blank = @"";
        for (int i = 1; i < level; i++) {
            blank = [NSString stringWithFormat:@"  %@", blank];
        }
        // 打印子视图类名
        NSLog(@"subView %@%d: %@", blank, level, subview.class);
        // 递归获取此视图的子视图
        [self getSub:subview andLevel:(level+1)];
    }
}

-(UIImage *)ty_getImageWithColor:(UIColor *)color{
    CGFloat height = [[UIApplication sharedApplication] statusBarFrame].size.height + 44;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    CGRect rect = CGRectMake(0,0,width,height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

-(UIImage *)ty_getImageWithColor:(UIColor *)color andAlpha:(CGFloat)alpha{
    CGFloat height = [[UIApplication sharedApplication] statusBarFrame].size.height + 44;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    CGRect rect = CGRectMake(0,0,width,height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[color colorWithAlphaComponent:alpha] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
