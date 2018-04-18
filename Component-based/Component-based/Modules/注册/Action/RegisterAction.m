//
//  RegisterAction.m
//  Component-based
//
//  Created by mac on 2018/4/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "RegisterAction.h"
#import "RegisterViewController.h"

@implementation RegisterAction

-(UIViewController *)registerController:(NSDictionary<NSString *,id> *)parameters {
    
    RegisterViewController *vc = [[RegisterViewController alloc] init];
    vc.account = [parameters valueForKey:@"account"];
    return vc;
}


@end
