//
//  AppDelegate.m
//  Component-based
//
//  Created by mac on 2018/1/29.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "Mediator.h"
#import "Public.h"
#import "Mediator+KKGuidePage.h"
#import "Mediator+Login.h"
#import "ViewController.h"
#import "PSWMainTabbarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //初始化UI
    [self initUI];
    //键盘回收相关
    [self receiveKeyboard];
    return YES;
}
#pragma mark ==================初始化UI==================
- (void)initUI {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //判断是否登录，决定是显示登录页面还是显示主页
    if ([UserCenter userIsLoginSuccess]) {
        
        //登录成功,显示主页
        PSWMainTabbarController *vc = [[PSWMainTabbarController alloc] init];
        self.window.rootViewController = vc;
        
    }else{
        
        //没有登录成功，显示登录页面
        UIViewController *vc = [[Mediator sharedInstance] kkUser_loginViewController];
        self.window.rootViewController = vc;
    }
    [self.window makeKeyAndVisible];
    [[Mediator sharedInstance]KKGuidePageChoiceAppear];
    //控制引导页是否展示
    [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"引导页"];
}
#pragma mark ==================键盘回收==================
- (void)receiveKeyboard {
    
    //关闭设置为NO, 默认值为NO.
    [IQKeyboardManager sharedManager].enable = YES;
    //点击背景收起键盘
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    //需要隐藏键盘上的工具条(默认打开)
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
