//
//  OnceLoadingView.h
//  OnceLoadingViewDemo
//
//  Created by 曹绍奇 on 2017/10/17.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OnceLoadingView : UIView
@property(nonatomic,copy) void (^failblock)(UIButton *sender);

#pragma mark 正在加载...
+(void)showLoading:(UIView *) view;
+(void)showLoadingWithStatus:(NSString *) string inView:(UIView *) view;
+(void)showLoadingWithImageArr:(NSArray *)images status:(NSString*)string inview:(UIView*)view;


#pragma mark --加载失败
+(void)showLoadingFailed:(UIView *) view event:(void (^)(UIButton *sender)) fail;
+(void)showLoadingFailed:(NSString *) string inView:(UIView *) view event:(void (^)(UIButton *sender)) fail;
+(void)showFailWithImageArr:(NSArray *)images status:(NSString *)string inView:(UIView *) view event:(void (^)(UIButton *sender)) fail;


#pragma mark --数据没找到
+(void)showNullWithinView:(UIView *) view;
+(void)showNullWithstatus:(NSString *)string inView:(UIView *) view;
+(void)showNullWithImage:(UIImage *)image status:(NSString*)string inview:(UIView*)view;



#pragma mark 无网络连接
+(void)showNoNetwork:(UIView *) view;
+(void)showNoNetworkWithStatus:(NSString *) string inView:(UIView *) view;
+(void)showNoNetworkWithImageArr:(NSArray *)images status:(NSString*)string inview:(UIView*)view;


#pragma mark --dismissMethod;
+(void)dismiss;

@end
