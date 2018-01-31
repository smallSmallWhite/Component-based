//
//  RootNavigationController.m
//  BESTKEEP-OC
//
//  Created by 毛韶谦 on 2016/10/26.
//  Copyright © 2016年 utouu. All rights reserved.
//

#import "RootNavigationController.h"
#import "Common.h"
#import <objc/runtime.h>


NSString *const RootNavigationDidPopViewControllerNotification = @"RootNavigationDidPopViewControllerNotification";

static BOOL RootNavigationControllerItemIsBackTtileExist;

@interface RootNavigationController ()

@end

@implementation RootNavigationController

+(void)load {
    RootNavigationControllerItemIsBackTtileExist = [Common isVariableWithClass:[UINavigationItem class] varName:@"backButtonTitle"];
}

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if(self) {
        [self configChildControllerBackTitle:@[rootViewController]];
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self defaultNavigationBarStyle];
}

- (void) defaultNavigationBarStyle {
    self.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationBar.translucent = YES;
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:18], NSForegroundColorAttributeName : [UIColor blackColor]};
    
    UIImage *backImageOriginal = [UIImage imageNamed:@"RootNavigationBack"];
    UIImage *backImage = [[self image:backImageOriginal leftOffset:7] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.navigationBar setBackIndicatorImage:backImage];
    [self.navigationBar setBackIndicatorTransitionMaskImage:backImage];
    
    
    [self.navigationBar setBackgroundImage:nil forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = nil;
}

- (void) setBackgroundColor:(UIColor*)color {
    UIImage *image = [self imageWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 3) color:color];
    [self.navigationBar setBackgroundImage:image forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (UIImage*) imageWithFrame:(CGRect)frame color:(UIColor*)color {
    UIGraphicsBeginImageContext(frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, frame);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)image:(UIImage*)image leftOffset:(CGFloat)leftOffset {
    UIImage *sourceImage = image;
    UIImage *newImage = nil;
    
    CGSize size = CGSizeMake(image.size.width + leftOffset, image.size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointMake(leftOffset, 0);
    thumbnailRect.size.width  = size.width - leftOffset;
    thumbnailRect.size.height = size.height;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage ;
}

-(void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    [self configChildControllerBackTitle:viewControllers];
    if(viewControllers && viewControllers.count > 1) {
        for (int i = 1; i < viewControllers.count; i++) {
            viewControllers[i].hidesBottomBarWhenPushed = YES;
        }
    }
    
    [super setViewControllers:viewControllers];
}

-(void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated {
    [self configChildControllerBackTitle:viewControllers];
    if(viewControllers && viewControllers.count > 1) {
        for (int i = 1; i < viewControllers.count; i++) {
            viewControllers[i].hidesBottomBarWhenPushed = YES;
        }
    }
    [super setViewControllers:viewControllers animated:animated];
}

#pragma -mark push
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self configChildControllerBackTitle:@[viewController]];
    if(self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma -mark show
-(void)showViewController:(UIViewController *)vc sender:(id)sender {
    [self configChildControllerBackTitle:@[vc]];
    if(self.viewControllers.count > 0) {
        vc.hidesBottomBarWhenPushed = YES;
    }
    [super showViewController:vc sender:sender];
}

#pragma -mark pop
-(UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
//    
//    
//    
//    
//    if ([[UIView BKcurrentViewController] isKindOfClass:[BK_SP_Fail_VC class]]||[[UIView BKcurrentViewController] isKindOfClass:[BK_SP_Success_VC class]]) {
//        
//        //获得视图控制器堆栈数组
//        NSArray *currentControllers = self.navigationController.viewControllers;
//        
//        //基于堆栈数组实例化新的数组
//        NSMutableArray *newControllers = [NSMutableArray arrayWithArray:currentControllers];
//        
//        
//        int count = 0;
//        
//        
//        
//        for (int i=0;i<newControllers.count;i++) {
//            if ([newControllers[i] isKindOfClass:[BK_SP_Fail_VC class]]||[newControllers[i] isKindOfClass:[BK_SP_Success_VC class]]) {
//                NSLog(@"--%d-->>>>>%@",i,newControllers[i] );
//                count=i;
//            }
//        }
//        
//        for (int i=0; i<count;i++) {
//            [newControllers removeLastObject];
//        }
//        
//        //为堆栈重新赋值
//        [self.navigationController setViewControllers:newControllers animated:YES];
//    }
//    
    
    
    
    
    
    UIViewController *controller  = [super popViewControllerAnimated:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RootNavigationDidPopViewControllerNotification object:nil userInfo:nil];
    
    return controller;
}

/**
 配置viewController返回按钮的title
 */
-(void)configChildControllerBackTitle:(NSArray<__kindof UIViewController*> *) viewControllers {
    
    if(!viewControllers || viewControllers.count == 0) {
        return;
    }
    
    if(RootNavigationControllerItemIsBackTtileExist) {
        for (UIViewController *controller in viewControllers) {
            
            [controller.navigationItem setValue:@"" forKey:@"backButtonTitle"];
        }
    }
}



#pragma -mark Autorotate

-(BOOL)shouldAutorotate {
    
//    return self.viewControllers.lastObject.shouldAutorotate;
    return NO;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
//    return self.viewControllers.lastObject.supportedInterfaceOrientations;
    return UIInterfaceOrientationMaskPortrait;
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    
//    return self.viewControllers.lastObject.preferredInterfaceOrientationForPresentation;
    return UIInterfaceOrientationPortrait;
}

@end
