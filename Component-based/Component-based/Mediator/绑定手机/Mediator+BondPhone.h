//
//  Mediator+BondPhone.h
//  Component-based
//
//  Created by mac on 2018/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mediator.h"

@interface Mediator (BondPhone)

- (UIViewController *)bondPhoneWithNickName:(NSString *)nickName
                                 withAvatar:(NSString *)avatar
                                 withGender:(NSInteger)gender
                                   withType:(NSString *)type
                                    withUid:(NSString *)uid
                            withAccessToken:(NSString *)accessToken;

@end
