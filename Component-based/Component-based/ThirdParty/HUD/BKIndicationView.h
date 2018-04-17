//
//  BKIndicationView.h
//  bestkeep
//
//  Created by utouu on 17/1/12.
//  Copyright © 2017年 utouu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BKIndicationView : UIActivityIndicatorView

+(void)showInView:(UIView *)view;
+(void)dismiss;
+(void)showInView:(UIView *)view Point:(CGPoint)point;
+(void)dismissWithCenter:(CGPoint)point;
@end
