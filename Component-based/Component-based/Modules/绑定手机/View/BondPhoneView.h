//
//  BondPhoneView.h
//  Component-based
//
//  Created by mac on 2018/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSAccountTextField.h"
#import "PSVerifyTextField.h"
#import "PSPwdTextField.h"

@protocol BondPhoneViewDelegate <NSObject>

- (void)clickRegisterAction:(UIButton *)sender;

@end


@interface BondPhoneView : UIView

//账号输入框
@property (nonatomic,strong) PSAccountTextField *accountTF;
//验证码输入框
@property (nonatomic,strong) PSVerifyTextField *verifyTF;
//密码输入框
@property (nonatomic,strong) PSPwdTextField *pwdTF;
//注册按钮
@property (nonatomic,strong) UIButton *registerBtn;
//切换状态按钮
@property (nonatomic,strong) UIButton *changeBtn;
//发送验证码按钮
@property (nonatomic,strong) UIButton *verifyCodeBtn;
@property (nonatomic,weak) id <BondPhoneViewDelegate>delegate;

@end
