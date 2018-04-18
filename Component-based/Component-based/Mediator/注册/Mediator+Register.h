//
//  Mediator+Register.h
//  Component-based
//
//  Created by mac on 2018/4/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mediator.h"

@interface Mediator (Register)

//得到注册controller
- (UIViewController *)kkUser_RegisterControllerWithAccount:(NSString *)account;


@end
