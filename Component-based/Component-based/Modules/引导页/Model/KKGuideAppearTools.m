//
//  KKGuideAppearTools.m
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KKGuideAppearTools.h"

@implementation KKGuideAppearTools

+(BOOL)isShowGuidePage {
    
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"引导页"] isEqualToString:@"1"]) {
        
        return NO;
    }else{
        
        return YES;
    }
}


@end
