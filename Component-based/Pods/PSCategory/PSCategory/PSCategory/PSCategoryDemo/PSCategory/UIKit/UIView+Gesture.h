//
//  UIView+Gesture.h
//  ownerCarSide
//
//  Created by mac on 2017/6/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Gesture)


+ (void)addTapToView:(UIView *_Nullable)view
          withTarget:(UIView *_Nullable)target
             withTag:(NSInteger)tag
          withAction:(nullable SEL)action;

@end
