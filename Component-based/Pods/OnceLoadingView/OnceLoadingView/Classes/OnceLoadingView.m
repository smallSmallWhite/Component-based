//
//  OnceLoadingView.m
//  OnceLoadingViewDemo
//
//  Created by 曹绍奇 on 2017/10/17.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import "OnceLoadingView.h"

#define View_backgroundcolor    [UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1]
#define VLight_GrayColor         [UIColor colorWithRed:140.0/255 green:140.0/255 blue:140.0/255 alpha:1]
#define FailButton_Color        [UIColor blueColor]
#define Width                   [UIScreen mainScreen].bounds.size.width
#define Height                  [UIScreen mainScreen].bounds.size.height
#define fontName    @"Thonburi-Light"
#define LoadingRGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation OnceLoadingView
+ (OnceLoadingView*)sharedView {
    static dispatch_once_t once;
    static OnceLoadingView *sharedView;
    dispatch_once(&once, ^ { sharedView = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    });
    sharedView.backgroundColor = View_backgroundcolor;
    return sharedView;
}

#pragma mark 正在加载...
+(void)showLoading:(UIView *) view{
    [self showLoadingWithStatus:nil inView:view];
}

+(void)showLoadingWithStatus:(NSString *) string inView:(UIView *) view{
    [self showLoadingWithImageArr:nil status:string inview:view];
}

+(void)showLoadingWithImageArr:(NSArray *)images status:(NSString*)string inview:(UIView*)view{
    [[self sharedView] removeAllSubView];
    [self sharedView];
    [self sharedView].frame = CGRectMake(0, 0, view.frame.size.width,view.frame.size.height);
    [view addSubview:[self sharedView]];
    UIImageView *imv =  [self createImageViewWithFrame:CGRectMake((view.frame.size.width-200)/2, (view.frame.size.height-350)/2, 200, 200) image:nil];
    if (!images) {
        imv.animationImages = [NSArray arrayWithObjects:
                               [UIImage imageNamed:@"common_loading_loading_1"],
                               [UIImage imageNamed:@"common_loading_loading_2"],
                               [UIImage imageNamed:@"common_loading_noData"],nil];
    }else{
        imv.animationImages=images;
    }
    imv.animationDuration= 1.0;
    imv.animationRepeatCount= 0;
    [imv startAnimating];
    [[self sharedView] addSubview:imv];
    NSString *labelStr;
    if (string == nil || string == NULL || [string isEqualToString:@""]) {
        labelStr=@"正在玩命加载数据..";
    }else{
        labelStr=string;
    }
    UILabel *label = [self createLableWithTitle:labelStr frame:CGRectMake(0, imv.frame.origin.y+imv.frame.size.height, view.frame.size.width, 40)];
    [[self sharedView] addSubview:label];
}


#pragma mark 加载失败
+(void)showLoadingFailed:(UIView *) view event:(void (^)(UIButton *sender)) fail{
    [self showFailWithImageArr:nil status:nil inView:view event:fail];
}
+(void)showLoadingFailed:(NSString *) string inView:(UIView *) view event:(void (^)(UIButton *sender)) fail{
    [self showFailWithImageArr:nil status:string inView:view event:fail];
}
+(void)showFailWithImageArr:(NSArray *)images status:(NSString *)string inView:(UIView *) view event:(void (^)(UIButton *sender)) fail{
    [[self sharedView] removeAllSubView];
    [self sharedView];
    [self sharedView].frame = CGRectMake(0, 0, view.frame.size.width,view.frame.size.height);
    [self sharedView].failblock = fail;
    [view addSubview:[self sharedView]];
    UIImageView *imv =  [self createImageViewWithFrame:CGRectMake((view.frame.size.width-200)/2, (view.frame.size.height-350)/2, 200, 200) image:nil];
    if (!images) {
        imv.animationImages = [NSArray arrayWithObjects:
                               [UIImage imageNamed:@"common_loading_error_1"],
                               [UIImage imageNamed:@"common_loading_error_2"],
                               [UIImage imageNamed:@"common_loading_error_3"],
                               [UIImage imageNamed:@"common_loading_error_4"],nil];
    }else{
        imv.animationImages =images;
    }
    imv.animationDuration= 1.0;
    imv.animationRepeatCount= 0;
    [imv startAnimating];
    [[self sharedView] addSubview:imv];
    NSString *buttonStr;
    if (string == nil || string == NULL || [string isEqualToString:@""]) {
        buttonStr=@"重新加载";
    }else{
        buttonStr=string;
    }
    UIButton *button = [self createButtonWithTitle:buttonStr frame:CGRectMake((view.frame.size.width-60)/2, imv.frame.origin.y+imv.frame.size.height, 80, 40) backgrundImage:[self imageWithColor:VLight_GrayColor]];
    [button addTarget:self action:@selector(failEvent:) forControlEvents:UIControlEventTouchUpInside];
    [[self sharedView] addSubview:button];
}
#pragma mark 数据没找到
+(void)showNullWithinView:(UIView *) view{
    [self showNullWithstatus:nil inView:view];
}
+(void)showNullWithstatus:(NSString *)string inView:(UIView *) view{
    [self showNullWithImage:nil status:string inview:view];
}
+(void)showNullWithImage:(UIImage *)image status:(NSString*)string inview:(UIView*)view{
    [self sharedView];
    [self sharedView].frame = CGRectMake(0, 0, view.frame.size.width,view.frame.size.height);
    [view addSubview:[self sharedView]];
    UIImageView *imageView= [[UIImageView alloc] initWithFrame:CGRectMake((view.frame.size.width-200)/2, (view.frame.size.height-350)/2, 200, 200)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    if (!image) {
        imageView.image=[UIImage imageNamed:@"common_loading_noData"];
    }else{
        imageView.image=image;
    }
    [[self sharedView] addSubview:imageView];
    NSString *labelStr;
    if (string == nil || string == NULL || [string isEqualToString:@""]) {
        labelStr=@"什么都没找到啊T T";
    }else{
        labelStr=string;
    }
    UILabel *lbl = [self createLableWithTitle:labelStr frame:CGRectMake(0, imageView.frame.origin.y+imageView.frame.size.height, view.frame.size.width, 40)];
    [[self sharedView] addSubview:lbl];
}

#pragma mark 无网络连接
+(void)showNoNetwork:(UIView *) view{
    [self showNoNetworkWithStatus:nil inView:view];
}
+(void)showNoNetworkWithStatus:(NSString *) string inView:(UIView *) view{
    [self showNoNetworkWithImageArr:nil status:string inview:view];
}
+(void)showNoNetworkWithImageArr:(NSArray *)images status:(NSString*)string inview:(UIView*)view{
    [self sharedView];
    [self sharedView].frame = CGRectMake(0, 0, view.frame.size.width,view.frame.size.height);
    [view addSubview:[self sharedView]];
    UIImageView *imageView= [[UIImageView alloc] initWithFrame:CGRectMake((view.frame.size.width-200)/2, (view.frame.size.height-350)/2, 200, 200)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    if (!imageView.image) {
        imageView.image=[UIImage imageNamed:@"common_loading_error_4"];
    }else{
        imageView.image=imageView.image;
    }
    [[self sharedView] addSubview:imageView];
    NSString *labelStr;
    if (string == nil || string == NULL || [string isEqualToString:@""]) {
        labelStr=@"似乎已断开与互联网的连接.";
    }else{
        labelStr=string;
    }
    UILabel *lbl = [self createLableWithTitle:labelStr frame:CGRectMake(0, imageView.frame.origin.y+imageView.frame.size.height, view.frame.size.width, 40)];
    [[self sharedView] addSubview:lbl];
}

#pragma  mark ---custom UI
+(UIButton *)createButtonWithTitle:(NSString *) title frame:(CGRect) frame backgrundImage:(UIImage*) image;
{
    UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = FailButton_Color;
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:fontName size:12];
    button.layer.cornerRadius =4;
    button.clipsToBounds = YES;
    button.frame = CGRectMake(frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
    [button addTarget:self action:@selector(failEvent:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(UILabel *)createLableWithTitle:(NSString *) title frame:(CGRect) frame
{
    UILabel *lable = [[UILabel alloc] initWithFrame:frame];
    lable.text = title;
    lable.font = [UIFont fontWithName:fontName size:14];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = LoadingRGB16(0x666666);
    return lable;
}
+(UIView *)createBgViewWithFrame:(CGRect) frame
{
    UIView *bgView= [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    bgView.backgroundColor = View_backgroundcolor;
    bgView.userInteractionEnabled = YES;
    return bgView;
}
+(UIImageView *)createImageViewWithFrame:(CGRect) frame image:(UIImage*) image;
{
    UIImageView *imageView= [[UIImageView alloc] initWithFrame:frame];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    return imageView;
}

+(void)failEvent:(UIButton *)sender
{
    [self sharedView].failblock(sender);
}
+(void)dismiss;
{
    if (self) {
        [UIView animateWithDuration:0.2 animations:^{
            [self sharedView].alpha=0;
        } completion:^(BOOL finished) {
            [[self sharedView] removeFromSuperview];
        }];
    }
    //    NSLog(@"====%@",[self sharedView]);
}

#pragma  mark --Others Method
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
-(void)removeAllSubView
{
    for (id  view in self.subviews) {
        if ([view isKindOfClass:[UIView class]]) {
            UIView *v = (UIView *) view;
            [v removeFromSuperview];
            v=nil;
        }
    }
}

@end


