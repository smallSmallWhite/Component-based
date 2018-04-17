//
//  HUD.h
//  kztool
//
//  Created by 马鹏 on 16/6/23.
//  Copyright © 2016年 wutan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HUD : NSObject

+(void)dismiss;
//+(void)showProgress:(CGFloat)progress message:(NSString*)message;
+(void)showMessage:(NSString*)message;
+(void)showProgress:(NSString*)message;
+(void)showErrorMessage:(NSString*)message;
+(void)showSuccessMessage:(NSString*)message;
//+(void)initConfig;

#pragma -mark 2017-02-07
+(void)showMessage:(NSString *)message inView:(UIView*)view;
+(void)showProgress:(NSString *)message inView:(UIView*)view;
+(void)dismissInView:(UIView*)view;


@end
