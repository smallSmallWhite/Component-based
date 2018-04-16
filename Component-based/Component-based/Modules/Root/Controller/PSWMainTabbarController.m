//
//  XSWMainTabbarController.m
//  ownerCarSide
//
//  Created by mac on 2017/6/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "PSWMainTabbarController.h"
#import "RootNavigationController.h"
#import "Mediator+Mall.h"
#import "Mediator+Mine.h"
#import "Mediator+DayPiece.h"
#import "Mediator+RunPiece.h"
#import "AppDelegate.h"
#import "Common.h"


@interface PSWMainTabbarController ()<UITabBarControllerDelegate>

@end

@implementation PSWMainTabbarController
#pragma mark ==================单例==================
+ (instancetype)instance{
    AppDelegate *delegete = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController *vc = delegete.window.rootViewController;
    if ([vc isKindOfClass:[PSWMainTabbarController class]]) {
        return (PSWMainTabbarController *)vc;
    }else{
        return nil;
    }
}
#pragma mark ==================视图生命周期==================
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBaseUI];
}
- (void)loadBaseUI
{
    //设置代理
    self.delegate = self;
    /*
     *这里需要注意的是，如果使用addChildViewController方法将试图控制器一个一个添加到tabBarController中，编译器在编译的时候也是一个一个添加tabBarItem的，如果添加的tabBarItem超过了5个，那么最终显示出来的结果只有5个tabBarItem（实际上是不只五个的）。
     如果用另一种方法：将所有要添加的视图控制器先存放在一个数组中，然后将数组赋予self.viewControllers属性，在视图控制器超过5个的情况下，结果就会不一样（第5个tabBarItem显示为更多）
     */
    
    UIViewController *VC1 = [[Mediator sharedInstance] KKMain_mainViewController];
    VC1.tabBarItem.title = @"首页";
    VC1.tabBarItem.image = [UIImage imageNamed:@"home_normal"];
    VC1.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [VC1.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 0)];
    
    
    RootNavigationController *nav1 = [[RootNavigationController alloc] initWithRootViewController:VC1];
    
    
    UIViewController *VC2 = [[Mediator sharedInstance] KKMain_dayPieceViewController];
    VC2.tabBarItem.title = @"城市";
    VC2.tabBarItem.image = [UIImage imageNamed:@"mycity_normal"];
    VC2.tabBarItem.selectedImage = [[UIImage imageNamed:@"mycity_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [VC2.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 0)];
    RootNavigationController *nav2 = [[RootNavigationController alloc] initWithRootViewController:VC2];
    
    
    UIViewController *VC3 = [[Mediator sharedInstance] KKMain_runPieceViewController];
    VC3.tabBarItem.title = @"生活";
    VC3.tabBarItem.image = [[UIImage imageNamed:@"message_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC3.tabBarItem.selectedImage = [[UIImage imageNamed:@"message_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [VC3.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 0)];
    
    RootNavigationController *nav3 = [[RootNavigationController alloc] initWithRootViewController:VC3];
   
    
    UIViewController *VC5 = [[Mediator sharedInstance] KKMain_mineViewController];
    VC5.tabBarItem.title = @"我的";
    VC5.tabBarItem.image = [UIImage imageNamed:@"account_normal"];
    VC5.tabBarItem.selectedImage = [[UIImage imageNamed:@"account_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [VC5.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 0)];
    RootNavigationController *nav5 = [[RootNavigationController alloc] initWithRootViewController:VC5];
    
    //设置tabBarController的子视图控制器
    NSArray *arr = [NSArray arrayWithObjects:nav1,nav2,nav3,nav5,nil];
    self.viewControllers = arr;
    //该属性在more中的Edit按钮点击后有所体现
    self.customizableViewControllers = arr;
    
    //设置tabBar风格
    self.tabBar.barStyle = UIBarStyleDefault;
    //设置tabBar的背景颜色
    //   self.tabBar.barTintColor = [UIColor lightGrayColor];
    //注意设置backGroundColor并不是设置tarBar的背景是，而是设置bar底下一层的颜色
    //    self.tabBar.backgroundColor = [UIColor whiteColor];
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 49)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
    
    //设置所选中的tabBarItem的主题色（默认为蓝色）
    self.tabBar.tintColor = kRedColor;
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10], NSForegroundColorAttributeName :kNavigationColor} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:kRedColor} forState:UIControlStateSelected];
    
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UINavigationController *)navigationController
{
    return self.selectedViewController;
}



@end
