//
//  PSForgetPwdView.m
//  Component-based
//
//  Created by mac on 2018/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PSForgetPwdView.h"
#import "Public.h"

@interface PSForgetPwdView ()

//账号View
@property (nonatomic,strong) UIView *accountView;
//账号图片
@property (nonatomic,strong) UIImageView *accountImg;
//账号下划线
@property (nonatomic,strong) UIView *accountLineView;
//验证码View
@property (nonatomic,strong) UIView *verificationCodeView;
//验证码图片
@property (nonatomic,strong) UIImageView *verificationCodeImg;
//验证码下划线View
@property (nonatomic,strong) UIView *verificationCodeLineView;
//密码View
@property (nonatomic,strong) UIView *pwdView;
//密码图片
@property (nonatomic,strong) UIImageView *pwdImg;
//密码下划线
@property (nonatomic,strong) UIView *pwdLineView;
//提示label
@property (nonatomic,strong) UILabel *messageLabel;

@end


@implementation PSForgetPwdView

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //UI相关设置
        [self setBaseUI];
        //布局相关
        [self layOutViews];
    }
    return self;
}
#pragma mark ==================UI相关设置==================
- (void)setBaseUI {
    
    [self addSubview:self.accountView];
    [self.accountView addSubview:self.accountImg];
    [self.accountView addSubview:self.accountLineView];
    [self.accountView addSubview:self.accountTF];
    [self addSubview:self.verificationCodeView];
    [self.verificationCodeView addSubview:self.verificationCodeImg];
    [self.verificationCodeView addSubview:self.verificationCodeLineView];
    [self.verificationCodeView addSubview:self.verifyCodeBtn];
    [self.verificationCodeView addSubview:self.verifyTF];
    [self addSubview:self.pwdView];
    [self.pwdView addSubview:self.pwdImg];
    [self.pwdView addSubview:self.pwdLineView];
    [self.pwdView addSubview:self.pwdTF];
    [self.pwdView addSubview:self.changeBtn];
    [self addSubview:self.messageLabel];
    [self addSubview:self.registerBtn];
}
#pragma mark ==================布局相关==================
- (void)layOutViews {
    
    [self.accountView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).offset(30);
        make.leading.equalTo(self).offset(27);
        make.trailing.equalTo(self).offset(-27);
        make.height.equalTo([self autoScaleH:44]);
    }];
    [self.accountImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self.accountView).offset(10);
        make.centerY.equalTo(self.accountView).offset(0);
        make.width.height.equalTo(20);
    }];
    [self.accountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self.accountImg.mas_trailing).offset(12);
        make.trailing.equalTo(self.accountView).offset(0);
        make.centerY.equalTo(self.accountView).offset(0);
        make.height.equalTo(30);
    }];
//    [self.accountLineView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.leading.equalTo(self.accountView).offset(0);
//        make.trailing.equalTo(self.accountView).offset(0);
//        make.top.equalTo(self.accountView.mas_bottom).offset(-0.5);
//        make.width.height.equalTo(0.5);
//    }];
    [self.verificationCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.accountView.mas_bottom).offset(10);
        make.leading.equalTo(self).offset(27);
        make.trailing.equalTo(self).offset(-27);
        make.height.equalTo([self autoScaleH:44]);
    }];
    
    [self.verificationCodeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self.verificationCodeView).offset(10);
        make.centerY.equalTo(self.verificationCodeView).offset(0);
        make.width.height.equalTo(20);
    }];
//    [self.verificationCodeLineView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.leading.equalTo(self.verificationCodeView).offset(0);
//        make.trailing.equalTo(self.verificationCodeView).offset(0);
//        make.top.equalTo(self.verificationCodeView.mas_bottom).offset(-0.5);
//        make.width.height.equalTo(0.5);
//    }];
    [self.verifyCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(self.verificationCodeView).offset(0);
        make.centerY.equalTo(self.verificationCodeView).offset(0);
        make.width.equalTo([self autoScaleW:80]);
        make.height.equalTo([self autoScaleH:44]);
    }];
    [self.verifyTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self.verificationCodeImg.mas_trailing).offset(12);
        make.trailing.equalTo(self.verifyCodeBtn.mas_leading).offset(-12);
        make.centerY.equalTo(self.verificationCodeView).offset(0);
    }];
    [self.pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.verificationCodeView.mas_bottom).offset(10);
        make.leading.equalTo(self).offset(27);
        make.trailing.equalTo(self).offset(-27);
        make.height.equalTo([self autoScaleH:44]);
    }];
    [self.pwdImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self.pwdView).offset(10);
        make.centerY.equalTo(self.pwdView).offset(0);
        make.width.height.equalTo(20);
    }];
//    [self.pwdLineView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.leading.equalTo(self.pwdView).offset(0);
//        make.trailing.equalTo(self.pwdView).offset(0);
//        make.top.equalTo(self.pwdView.mas_bottom).offset(-0.5);
//        make.height.equalTo(0.5);
//    }];
    [self.changeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(self.pwdView).offset(-10);
        make.centerY.equalTo(self.pwdView).offset(0);
        make.width.height.equalTo(20);
    }];
    
    [self.pwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self.pwdImg.mas_trailing).offset(12);
        make.trailing.equalTo(self.changeBtn.mas_leading).offset(-12);
        make.centerY.equalTo(self.pwdView).offset(0);
    }];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self).offset(27);
        make.trailing.equalTo(self).offset(-27);
        make.top.equalTo(self.pwdView.mas_bottom).offset(11);
    }];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.messageLabel.mas_bottom).offset(46);
        make.leading.equalTo(self).offset(27);
        make.trailing.equalTo(self).offset(-27);
        make.height.equalTo([self autoScaleH:44]);
    }];
}
#pragma mark ==================按钮点击事件==================
- (void)clickAction:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickRegisterAction:)]) {
        
        [self.delegate clickRegisterAction:sender];
    }
}
- (void)clickChangeAction:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (sender.isSelected) {
        
        [sender setImage:[UIImage imageNamed:@"register_visible"] forState:(UIControlStateNormal)];
        self.pwdTF.secureTextEntry = NO;
        
    }else{
        
        [sender setImage:[UIImage imageNamed:@"register_unVisible"] forState:(UIControlStateNormal)];
        self.pwdTF.secureTextEntry = YES;
    }
}
#pragma mark ==================懒加载==================
-(UIView *)accountView {
    
    if (!_accountView) {
        _accountView = [[UIView alloc] init];
        _accountView.backgroundColor = [UIColor whiteColor];
    }
    return _accountView;
}
-(UIImageView *)accountImg {
    
    if (!_accountImg) {
        
        _accountImg = [[UIImageView alloc] init];
        _accountImg.image = [UIImage imageNamed:@"forgetPwd_account"];
    }
    return _accountImg;
}
-(UIView *)accountLineView {
    
    if (!_accountLineView) {
        
        _accountLineView = [[UIView alloc] init];
        _accountLineView.backgroundColor = kUnderlineColor;
    }
    return _accountLineView;
}
-(PSAccountTextField *)accountTF {
    
    if (!_accountTF) {
        
        _accountTF = [[PSAccountTextField alloc] init];
        _accountTF.placeholder = @"请输入手机号码注册";
    }
    return _accountTF;
}
-(UIView *)verificationCodeView {
    
    if (!_verificationCodeView) {
        
        _verificationCodeView = [[UIView alloc] init];
        _verificationCodeView.backgroundColor = [UIColor whiteColor];
    }
    return _verificationCodeView;
}
-(UIView *)verificationCodeLineView {
    
    if (!_verificationCodeLineView) {
        
        _verificationCodeLineView = [[UIView alloc] init];
        _verificationCodeLineView.backgroundColor = kUnderlineColor;
    }
    return _verificationCodeLineView;
}
-(UIImageView *)verificationCodeImg {
    
    if (!_verificationCodeImg) {
        
        _verificationCodeImg = [[UIImageView alloc] init];
        _verificationCodeImg.image = [UIImage imageNamed:@"forgetPwd_verifyCode"];
    }
    return _verificationCodeImg;
}
-(PSVerifyTextField *)verifyTF {
    
    if (!_verifyTF) {
        
        _verifyTF = [[PSVerifyTextField alloc] init];
        _verifyTF.placeholder = @"请输入验证码";
    }
    return _verifyTF;
}
-(UIButton *)verifyCodeBtn {
    
    if (!_verifyCodeBtn) {
        
        _verifyCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_verifyCodeBtn setBackgroundColor:kBtnNormalColor];
        [UIButton setBtnTextColor:UIColorFromRGBValue(0x333333) AndFontSize:[self autoScaleW:13] WithBtn:_verifyCodeBtn];
        [_verifyCodeBtn setTitle:@"获取验证码" forState:(UIControlStateNormal)];
        _verifyCodeBtn.tag = 5000;
        _verifyCodeBtn.userInteractionEnabled = NO;
        [_verifyCodeBtn addTarget:self action:@selector(clickAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _verifyCodeBtn;
}
-(UIView *)pwdView {
    
    if (!_pwdView) {
        
        _pwdView = [[UIView alloc] init];
        _pwdView.backgroundColor = [UIColor whiteColor];
    }
    return _pwdView;
}
-(UIImageView *)pwdImg {
    
    if (!_pwdImg) {
        
        _pwdImg = [[UIImageView alloc] init];
        _pwdImg.image = [UIImage imageNamed:@"forgetPwd_mima"];
    }
    return _pwdImg;
}
-(UIView *)pwdLineView {
    
    if (!_pwdLineView) {
        
        _pwdLineView = [[UIView alloc] init];
        _pwdLineView.backgroundColor = kUnderlineColor;
    }
    return _pwdLineView;
}
-(PSPwdTextField *)pwdTF {
    
    if (!_pwdTF) {
        
        _pwdTF = [[PSPwdTextField alloc] init];
        _pwdTF.placeholder = @"请设置登录密码";
    }
    return _pwdTF;
}
-(UIButton *)changeBtn {
    
    if (!_changeBtn) {
        
        _changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_changeBtn setImage:[UIImage imageNamed:@"register_unVisible"] forState:(UIControlStateNormal)];
        [_changeBtn addTarget:self action:@selector(clickChangeAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _changeBtn;
}
-(UILabel *)messageLabel {
    
    if (!_messageLabel) {
        
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.text = @"(6-20位字符可包含数组、字母、符号)";
        [UILabel setLabelTextColor:UIColorFromRGBValue(0x666666) AndFontSize:[self autoScaleW:13] WithLabel:_messageLabel];
    }
    return _messageLabel;
}
-(UIButton *)registerBtn {
    
    if (!_registerBtn) {
        
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerBtn.backgroundColor = kBtnNormalColor;
        _registerBtn.layer.cornerRadius = 10;
        _registerBtn.layer.masksToBounds = YES;
        _registerBtn.tag = 5001;
        [UIButton setBtnTextColor:UIColorFromRGBValue(0x333333) AndFontSize:[self autoScaleW:17] WithBtn:_registerBtn];
        [_registerBtn setTitle:@"完成" forState:(UIControlStateNormal)];
        [_registerBtn addTarget:self action:@selector(clickAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _registerBtn;
}
@end
