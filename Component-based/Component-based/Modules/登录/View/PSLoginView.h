//
//  PSLoginView.h
//  Component-based
//
//  Created by mac on 2018/4/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSAccountTextField.h"
#import "PSPwdTextField.h"

@protocol PSLoginViewDelegate <NSObject>

- (void)clickAction:(UIButton *)sender;

@end


@interface PSLoginView : UIView
//账号输入框
@property (nonatomic,strong) PSAccountTextField *accountTF;
//密码输入框
@property (nonatomic,strong) PSPwdTextField *pwdTF;
//登录按钮
@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,weak) id <PSLoginViewDelegate>delegate;
@end
