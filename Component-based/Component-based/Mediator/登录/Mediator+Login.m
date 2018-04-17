//
//  Mediator+Login.m
//  Component-based
//
//  Created by mac on 2018/4/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mediator+Login.h"

NSString *const kkLoginTarget  = @"kkLoginAction";
NSString *const kkLoginAction  = @"loginViewController";
@implementation Mediator (Login)

- (UIViewController *)kkUser_loginViewController {
    
    MediatorOptions *options = [MediatorOptions optionsWithTargetName:kkLoginTarget actionName:kkLoginAction];
    return [self performWithOptions:options];
}

@end
