//
//  UIView+Gesture.m
//  ownerCarSide
//
//  Created by mac on 2017/6/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "UIView+Gesture.h"

@implementation UIView (Gesture)

+ (void)addTapToView:(UIView *)view withTarget:(UIView *)target withTag:(NSInteger)tag withAction:(SEL)action{
    
    if (target.superview != nil) {
        
        target.superview.userInteractionEnabled = YES;
    }
    view.tag = tag;
    view.userInteractionEnabled = YES;
    target.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [view addGestureRecognizer:tap];
}

@end
