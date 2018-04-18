//
//  Mediator+ForgetPwd.m
//  Component-based
//
//  Created by mac on 2018/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mediator+ForgetPwd.h"

NSString *const forgetTargetName = @"ForgetTargetAction";
NSString *const forgetTargetAction = @"forgetPwdViewController";

@implementation Mediator (ForgetPwd)

-(UIViewController *)kkUser_ForgetPwdViewController {
    
    MediatorOptions *options = [MediatorOptions optionsWithTargetName:forgetTargetName actionName:forgetTargetAction];
    return [self performWithOptions:options];
}


@end
