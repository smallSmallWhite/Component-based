//
//  PSLoginView.m
//  Component-based
//
//  Created by mac on 2018/4/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PSLoginView.h"
#import "Public.h"

@interface PSLoginView ()

//账号View
@property (nonatomic,strong) UIView *accountView;
//账号图片
@property (nonatomic,strong) UIImageView *accountImg;
//账号下划线
@property (nonatomic,strong) UIView *accountLineView;
//密码View
@property (nonatomic,strong) UIView *pwdView;
//密码图片
@property (nonatomic,strong) UIImageView *pwdImg;
//密码下划线
@property (nonatomic,strong) UIView *pwdLineView;
//注册按钮
@property (nonatomic,strong) UIButton *registerBtn;
//忘记密码按钮
@property (nonatomic,strong) UIButton *forgetPwdBtn;
@end

@implementation PSLoginView

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
    [self addSubview:self.pwdView];
    [self.pwdView addSubview:self.pwdImg];
    [self.pwdView addSubview:self.pwdLineView];
    [self.pwdView addSubview:self.pwdTF];
    [self addSubview:self.loginBtn];
    [self addSubview:self.registerBtn];
    [self addSubview:self.forgetPwdBtn];
}
#pragma mark ==================布局相关==================
- (void)layOutViews {
    
    [self.accountView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self).offset(20);
        make.leading.equalTo(self).offset(27);
        make.trailing.equalTo(self).offset(-27);
        make.height.equalTo([self autoScaleH:44]);
    }];
    [self.accountImg mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.equalTo(self.accountView).offset(0);
        make.centerY.equalTo(self.accountView).offset(0);
        make.width.height.equalTo(20);
    }];
    [self.accountTF mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.equalTo(self.accountImg.mas_trailing).offset(12);
        make.trailing.equalTo(self.accountView).offset(0);
        make.centerY.equalTo(self.accountView).offset(0);
        make.height.equalTo(30);
    }];
    [self.accountLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self.accountView).offset(0);
        make.trailing.equalTo(self.accountView).offset(0);
        make.top.equalTo(self.accountView.mas_bottom).offset(-0.5);
        make.width.height.equalTo(0.5);
    }];
    [self.pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.accountView.mas_bottom).offset(10);
        make.leading.equalTo(self).offset(27);
        make.trailing.equalTo(self).offset(-27);
        make.height.equalTo([self autoScaleH:44]);
    }];
    [self.pwdImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self.pwdView).offset(0);
        make.centerY.equalTo(self.pwdView).offset(0);
        make.width.height.equalTo(20);
    }];
    [self.pwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self.pwdImg.mas_trailing).offset(12);
        make.centerY.equalTo(self.pwdView).offset(0);
        make.trailing.equalTo(self.pwdView).offset(0);
    }];
    [self.pwdLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self.pwdView).offset(0);
        make.trailing.equalTo(self.pwdView).offset(0);
        make.top.equalTo(self.pwdView.mas_bottom).offset(-0.5);
        make.width.height.equalTo(0.5);
    }];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.equalTo(self).offset(27);
        make.trailing.equalTo(self).offset(-27);
        make.top.equalTo(self.pwdView.mas_bottom).offset([self autoScaleH:37]);
        make.height.equalTo([self autoScaleH:44]);
        
    }];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.equalTo(self).offset(27);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(10);
    }];
    [self.forgetPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(self).offset(-27);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(10);
    }];
    
}
#pragma mark ==================点击登录按钮==================
- (void)clickLoginAction:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickAction:)]) {
        
        [self.delegate clickAction:sender];
    }
}
#pragma mark ==================点击注册按钮==================
- (void)clickRegisterAction:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickAction:)]) {
        
        [self.delegate clickAction:sender];
    }
}
#pragma mark ==================点击忘记密码按钮==================
- (void)clickForgetBtnAction:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickAction:)]) {
        
        [self.delegate clickAction:sender];
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
-(UIView *)pwdView {
    
    if (!_pwdView) {
        
        _pwdView = [[UIView alloc] init];
        _pwdView.backgroundColor = [UIColor whiteColor];
    }
    return _pwdView;
}
-(UIImageView *)accountImg {
    
    if (!_accountImg) {
        
        _accountImg = [[UIImageView alloc] init];
        _accountImg.image = [UIImage imageNamed:@"login_account"];
    }
    return _accountImg;
}
-(UIImageView *)pwdImg {
    
    if (!_pwdImg) {
        
        _pwdImg = [[UIImageView alloc] init];
        _pwdImg.image = [UIImage imageNamed:@"login_pwd"];
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
        _accountTF.placeholder = @"请输入账号";
    }
    return _accountTF;
}
-(PSPwdTextField *)pwdTF {
    
    if (!_pwdTF) {
        
        _pwdTF = [[PSPwdTextField alloc] init];
        _pwdTF.placeholder = @"请输入密码";
    }
    return _pwdTF;
}
-(UIButton *)loginBtn {
    
    if (!_loginBtn) {
        
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
        [UIButton setBtnTextColor:[UIColor whiteColor] AndFontSize:[self autoScaleW:17] WithBtn:_loginBtn];
        _loginBtn.backgroundColor = kBtnNormalColor;
        _loginBtn.userInteractionEnabled = NO;
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.tag = 5000;
        _loginBtn.layer.cornerRadius = 10;
        [_loginBtn addTarget:self action:@selector(clickLoginAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _loginBtn;
}
-(UIButton *)registerBtn {
    
    if (!_registerBtn) {
        
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"手机快速注册 >" forState:(UIControlStateNormal)];
        _registerBtn.tag = 5001;
        [UIButton setBtnTextColor:UIColorFromRGBValue(0x333333) AndFontSize:[self autoScaleW:12] WithBtn:_registerBtn];
        [_registerBtn addTarget:self action:@selector(clickRegisterAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _registerBtn;
}
-(UIButton *)forgetPwdBtn {
    
    if (!_forgetPwdBtn) {
        
        _forgetPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgetPwdBtn setTitle:@"忘记密码?" forState:(UIControlStateNormal)];
        _forgetPwdBtn.tag = 5002;
        [UIButton setBtnTextColor:UIColorFromRGBValue(0x333333) AndFontSize:[self autoScaleW:12] WithBtn:_forgetPwdBtn];
        [_forgetPwdBtn addTarget:self action:@selector(clickForgetBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _forgetPwdBtn;
}
@end
