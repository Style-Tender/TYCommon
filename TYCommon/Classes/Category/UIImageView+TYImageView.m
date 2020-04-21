//
//  UIImageView+TYImageView.m
//  AFNetworking
//
//  Created by Dou Guangzheng on 2020/4/21.
//

#import "UIImageView+TYImageView.h"

@implementation UIImageView (TYImageView)

+(UIImageView *)ty_icon{
    UIImageView *icon = [[UIImageView alloc]init];
    icon.contentMode = UIViewContentModeScaleAspectFill;
    icon.clipsToBounds = YES;
    return icon;
}

+(UIImageView *)ty_iconWithcornerRadius:(CGFloat)cornerRadius{
    UIImageView *icon = [[UIImageView alloc]init];
    icon.contentMode = UIViewContentModeScaleAspectFill;
    icon.layer.cornerRadius = cornerRadius;
    icon.clipsToBounds = YES;
    return icon;
}

@end
