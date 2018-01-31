//
//  Common.m
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Common.h"
#import <objc/runtime.h>

@implementation Common

+(BOOL)isVariableWithClass:(Class)cls varName:(NSString *)name {
    unsigned int outCount, i;
    Ivar *ivars = class_copyIvarList(cls, &outCount);
    for (i = 0; i < outCount; i++) {
        Ivar property = ivars[i];
        NSString *keyName = [NSString stringWithCString:ivar_getName(property) encoding:NSUTF8StringEncoding];
        keyName = [keyName stringByReplacingOccurrencesOfString:@"_" withString:@""];
        if ([keyName isEqualToString:name]) {
            return YES;
        }
    }
    return NO;
}


@end
