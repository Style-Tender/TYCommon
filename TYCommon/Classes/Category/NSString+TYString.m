//
//  NSString+TYString.m
//  ELife
//
//  Created by heimou on 2019/12/26.
//  Copyright © 2019 heimou. All rights reserved.
//

#import "NSString+TYString.h"

@implementation NSString (TYString)

-(BOOL)ty_isNotEmpty{
    if (!self) {
        return NO;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return NO;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return NO;
    }
    return YES;
}

-(NSArray<NSString *> *)ty_componentsSeparatedByString:(NSString *)str{
    NSArray<NSString *> *a = [self componentsSeparatedByString:str];
    NSMutableArray<NSString *> *b = [NSMutableArray array];
    for (NSString *s in a) {
        if([s ty_isNotEmpty]){
            [b addObject:s];
        }
    }
    return b;
}

- (NSString *)ty_covertToPinyin {
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    mutableString = (NSMutableString *)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    return [mutableString stringByReplacingOccurrencesOfString:@"'" withString:@""];
}

@end

@implementation NSString (Code)

-(NSString *)ty_encode{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "]];
}

@end

@implementation NSString (Size)

-(CGFloat)ty_heightOfFont:(UIFont *)font andMaxWidth:(CGFloat)width{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return ceil(size.height);
}

-(CGFloat)ty_widthOfFont:(UIFont *)font andMaxHeight:(CGFloat)height{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGSize maxSize = CGSizeMake(MAXFLOAT, height);
    CGSize size = [self boundingRectWithSize:maxSize options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return ceil(size.width);
}

@end
