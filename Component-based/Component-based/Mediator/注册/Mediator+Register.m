//
//  Mediator+Register.m
//  Component-based
//
//  Created by mac on 2018/4/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mediator+Register.h"

NSString *const kkRegisterTarget = @"RegisterAction";
NSString *const kkRegisterAction = @"registerController:";

@implementation Mediator (Register)

//得到注册controller
- (UIViewController *)kkUser_RegisterControllerWithAccount:(NSString *)account {
    
    MediatorOptions *options = [MediatorOptions optionsWithTargetName:kkRegisterTarget actionName:kkRegisterAction];
    options.parameters = @{@"account":account};
    return [self performWithOptions:options];
}

@end
