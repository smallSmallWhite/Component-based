//
//  KKGuidePageAction.m
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KKGuidePageAction.h"
#import "KKGuideAppearTools.h"
#import "KKGuidePageController.h"

@implementation KKGuidePageAction

-(id)KKGuideAppear {
    
    BOOL appear = [KKGuideAppearTools isShowGuidePage];
    if (appear) {
        KKGuidePageController *vc = [[KKGuidePageController alloc] init];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:NO completion:nil];
        return @"1";
    }else{
        
        return @"0";
    }
}
-(id)KKGuideAppearFrom:(NSDictionary *)controller {
    
    UIViewController *Controller = controller[@"Controller"];
    KKGuidePageController *vc = [[KKGuidePageController alloc] init];
    [Controller presentViewController:vc animated:NO completion:nil];
    return @"";
}

@end
