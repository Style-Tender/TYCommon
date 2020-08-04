//
//  TYViewController.m
//  TYCommon
//
//  Created by 785072254@qq.com on 02/28/2020.
//  Copyright (c) 2020 785072254@qq.com. All rights reserved.
//

#import "TYViewController.h"
#import <TYNavigationBarManager.h>

#import <TYPhoneUtils.h>

@interface TYViewController ()<UIScrollViewDelegate>

@end

@implementation TYViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self initView];
    
    TYLog(@"机型： %@",TYPhoneUtils.ty_getPhoneModel);
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    if(checkSystemVer(13.0)){
        return UIStatusBarStyleDarkContent;
    }else{
        return UIStatusBarStyleDefault;
    }
}

-(void)initView{
    self.view.backgroundColor = UIColor.grayColor;
    [self ty_setNavigationBarBackgroundAlpha:0];
    [self ty_setNavigationBarBackgroundColor:UIColor.whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.backgroundColor = UIColor.redColor;
    scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    UIView *redView = [UIView ty_ViewWithColor:UIColor.yellowColor];
    redView.frame = CGRectMake(0, 0, ScreenW, 300 + Nav_StatusBarH);
    [scrollView addSubview:redView];
    
    UIView *blueView = [UIView ty_ViewWithColor:UIColor.blueColor];
    blueView.frame = CGRectMake(0, 300 + Nav_StatusBarH, ScreenW, 100);
    [scrollView addSubview:blueView];
    
    scrollView.contentSize = CGSizeMake(0, 2 * ScreenH);
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat alpha = MIN(offset / 300, 1);

    TYLog(@"当前透明度  %f   %f",alpha ,  offset);

    [self ty_setNavigationBarBackgroundAlpha:alpha];
}

@end
