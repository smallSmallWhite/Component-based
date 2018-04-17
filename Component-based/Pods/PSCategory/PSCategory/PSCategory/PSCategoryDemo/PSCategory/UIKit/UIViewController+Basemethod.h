//
//  UIViewController+Basemethod.h
//  ownerCarSide
//
//  Created by mac on 2017/6/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 
 这个类是自适应字体的类
 */

@interface UIViewController (Basemethod)
//自适应宽度的
- (CGFloat)autoScaleW:(CGFloat)w;
//自适应高度的
- (CGFloat)autoScaleH:(CGFloat)h;
@end
