//
//  NSArray+TYArray.m
//  ELife
//
//  Created by heimou on 2019/12/26.
//  Copyright © 2019 heimou. All rights reserved.
//

#import "NSArray+TYArray.h"

@implementation NSArray (Join)

-(NSString *)ty_join:(NSString *)str{
    NSMutableString *string = [NSMutableString string];
    
    BOOL isStarted = NO;
    for (NSObject *obj in self) {
        if([obj isKindOfClass:[NSString class]]){
            if(isStarted){
                [string appendString:str];
            }
            [string appendString:(NSString *)obj];
            isStarted = YES;
        }
    }
    
    return string;
}

@end

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level{
    
    NSMutableString *mStr = [NSMutableString string];
    NSMutableString *tab = [NSMutableString stringWithString:@""];
    for (int i = 0; i < level; i++) {
        [tab appendString:@"\t"];
    }
    [mStr appendString:@"(\n"];
    for (int i = 0; i < self.count; i++) {
        NSString *lastSymbol = (self.count == i + 1) ? @"":@",";
        id value = self[i];
        if ([value respondsToSelector:@selector(descriptionWithLocale:indent:)]) {
            [mStr appendFormat:@"\t%@%@%@\n",tab,[value descriptionWithLocale:locale indent:level + 1],lastSymbol];
        } else {
            [mStr appendFormat:@"\t%@%@%@\n",tab,value,lastSymbol];
        }
    }
    [mStr appendFormat:@"%@)",tab];
    return mStr;
    
}

@end
