//
//  Mediator+BondPhone.m
//  Component-based
//
//  Created by mac on 2018/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mediator+BondPhone.h"

NSString *const targetName = @"BondPhoneAction";
NSString *const targetAction = @"bondPhoneViewController:";

@implementation Mediator (BondPhone)

-(UIViewController *)bondPhoneWithNickName:(NSString *)nickName withAvatar:(NSString *)avatar withGender:(NSInteger)gender withType:(NSString *)type withUid:(NSString *)uid withAccessToken:(NSString *)accessToken {
    
    MediatorOptions *options = [MediatorOptions optionsWithTargetName:targetName actionName:targetAction];
    options.parameters = @{@"nickName":nickName,@"avatar":avatar,@"gender":@(gender),@"type":type,@"uid":uid,@"accessToken":accessToken};
    return [self performWithOptions:options];
}


@end
