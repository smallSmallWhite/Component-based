//
//  UserCenter.m
//  Component-based
//
//  Created by mac on 2018/4/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UserCenter.h"

@implementation UserCenter
//用户是否登录
+ (BOOL)userIsLoginSuccess {
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"token"] != nil) {
        
        //登录成功
        return YES;
    }else {
        
        //登录失败
        return NO;
    }
}

@end
