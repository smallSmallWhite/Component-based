//
//  BondPhoneController.h
//  Component-based
//
//  Created by mac on 2018/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BondPhoneController : UIViewController
//昵称
@property (nonatomic,strong) NSString *nickName;
//头像
@property (nonatomic,strong) NSString *avatar;
//性别
@property (nonatomic,assign) NSInteger sex;
//类型
@property (nonatomic,strong) NSString *type;
//uid
@property (nonatomic,strong) NSString *uid;
//accessToken
@property (nonatomic,strong) NSString *accessToken;

@end
