//
//  BondPhoneAction.m
//  Component-based
//
//  Created by mac on 2018/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "BondPhoneAction.h"
#import "BondPhoneController.h"

@implementation BondPhoneAction

-(id)bondPhoneViewController:(NSDictionary<NSString *,id> *)parameters {
    
    BondPhoneController *vc = [[BondPhoneController alloc] init];
    vc.nickName = parameters[@"nickName"];
    vc.avatar = parameters[@"avatar"];
    vc.sex = [parameters[@"gender"] integerValue];
    vc.type = parameters[@"type"];
    vc.uid = parameters[@"uid"];
    vc.accessToken = parameters[@"accessToken"];
    return vc;
}


@end
