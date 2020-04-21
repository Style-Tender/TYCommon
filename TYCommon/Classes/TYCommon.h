//
//  TYCommon.h
//  ELife
//
//  Created by heimou on 2019/12/26.
//  Copyright © 2019 heimou. All rights reserved.
//

#ifndef TYCommon_h
#define TYCommon_h


#endif /* TYCommon_h */

//自定义打印内容
#ifdef DEBUG
#define TYLog(...) NSLog(__VA_ARGS__);
#else
#define TYLog(...) ;
#endif

//字体
#define TYFont(float) [UIFont systemFontOfSize:F(float) weight:UIFontWeightRegular]
#define TYFont_Medium(float) [UIFont systemFontOfSize:F(float) weight:UIFontWeightMedium]
#define TYFont_Semibold(float) [UIFont systemFontOfSize:F(float) weight:UIFontWeightSemibold]
#define TYFont_Bold(float) [UIFont systemFontOfSize:F(float) weight:UIFontWeightBold]


#define ty_weakSelf __weak typeof(self) weakSelf = self;

#define checkSystemVer(float) @available(iOS float, *)

#define StatusBarH [[UIApplication sharedApplication] statusBarFrame].size.height
#define NavBarH 44
#define Nav_StatusBarH (StatusBarH + NavBarH)

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

#define ScreenScale [[UIScreen mainScreen] scale]

#define iphone5 (ScreenH == 568 && ScreenScale == 2.0)
#define iphone6 (ScreenH == 667 && ScreenScale == 2.0)
#define iphone6P (ScreenH == 736 && ScreenScale == 3.0)
#define iphoneX (ScreenH == 812 && ScreenScale == 3.0)
#define iphoneXS_Max (ScreenH == 896 && ScreenScale == 3.0)
#define iphoneXR (ScreenH == 896 && ScreenScale == 2.0)
#define isIphoneFull (iphoneX || iphoneXS_Max || iphoneXR)

#define TabBarH (isIphoneFull?83:49)
#define TopMargin (isIphoneFull?44:20)
#define BottomMargin (isIphoneFull?34:0)

#import "TYConfig.h"

#import "UIColor+TYColor.h"
#import "UIView+TYView.h"
#import "UIImage+TYImage.h"
#import "NSArray+TYArray.h"
#import "NSDictionary+TYDictionary.h"
#import "NSString+TYString.h"
#import "UIButton+TYButton.h"
#import "UILabel+TYLabel.h"
#import "UIImageView+TYImageView.h"

#import "TYStorageUtils.h"
