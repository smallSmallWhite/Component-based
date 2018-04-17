//
//  PSThirdLoginView.m
//  Component-based
//
//  Created by mac on 2018/4/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PSThirdLoginView.h"
#import "Public.h"

@interface PSThirdLoginView ()
//登录方式展示label
@property (nonatomic,strong) UILabel *loginWayLabel;
//左边的View
@property (nonatomic,strong) UIView *leftView;
//右边的View
@property (nonatomic,strong) UIView *rightView;
//微信登录按钮
@property (nonatomic,strong) UIButton *weChatBtn;
//qq登录按钮
@property (nonatomic,strong) UIButton *qqBtn;
//用户协议按钮
@property (nonatomic,strong) UIButton *userAgreementBtn;
//qq和微信的安装的状态
@property (nonatomic,strong) NSString *loginState;
@end
@implementation PSThirdLoginView

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //判断是否安装qq或者微信
        [self judgeIsInstalledQQAndWeChat];
        //UI相关设置
        [self setBaseUI];
        //布局相关
        [self layOutViews];
        
    }
    return self;
}
#pragma mark ==================判断是否安装qq和微信==================
- (void)judgeIsInstalledQQAndWeChat {
    
    //判断是否安装了QQ和微信客户端
    if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]] && ![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
        
        //QQ和微信都没有安装
        _loginState = @"2";
        
    }else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]] && ![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]){
        
        //安装了微信
        _loginState = @"0";
        
    }else if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]] && [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]){
        
        //安装了QQ
        _loginState = @"1";
        
        
    }else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]] && [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]){
        
        //QQ和微信都安装了
        _loginState = @"3";
    }
}
#pragma mark ==================UI相关设置==================
- (void)setBaseUI {
    
    [self addSubview:self.loginWayLabel];
    [self addSubview:self.leftView];
    [self addSubview:self.rightView];
    [self addSubview:self.weChatBtn];
    [self addSubview:self.qqBtn];
    [self addSubview:self.userAgreementBtn];
}
#pragma mark ==================布局相关==================
- (void)layOutViews {
    
    if (![_loginState isEqualToString:@"2"]) {
        
        //qq或者微信至少安装了一个
        [self.loginWayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self).offset(0);
            make.top.equalTo(self).offset([self autoScaleH:35]);
        }];
        [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.loginWayLabel).offset(0);
            make.trailing.equalTo(self.loginWayLabel.mas_leading).offset(-10);
            make.height.equalTo(0.5);
            make.width.equalTo([self autoScaleW:45]);
        }];
        [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.loginWayLabel).offset(0);
            make.leading.equalTo(self.loginWayLabel.mas_trailing).offset(10);
            make.height.equalTo(0.5);
            make.width.equalTo([self autoScaleW:45]);
        }];
        if ([_loginState isEqualToString:@"3"]) {
            
            //俩者都安装
            [self.weChatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(self.loginWayLabel.mas_bottom).offset([self autoScaleH:24]);
                make.width.height.equalTo([self autoScaleW:40]);
                make.centerX.equalTo(self).offset(-([self autoScaleW:40]/2 + 8.5));
                
            }];
            [self.qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(self.loginWayLabel.mas_bottom).offset([self autoScaleH:24]);
                make.width.height.equalTo([self autoScaleW:40]);
                make.centerX.equalTo(self).offset(([self autoScaleW:40]/2 + 8.5));
                
            }];
        }else if ([_loginState isEqualToString:@"1"]) {
            
            //只安装了qq
            [self.qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(self.loginWayLabel.mas_bottom).offset([self autoScaleH:24]);
                make.width.height.equalTo([self autoScaleW:40]);
                make.centerX.equalTo(self).offset(0);
                
            }];
        }else if ([_loginState isEqualToString:@"0"]) {
            
            //只安装了微信
            [self.weChatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(self.loginWayLabel.mas_bottom).offset([self autoScaleH:24]);
                make.width.height.equalTo([self autoScaleW:40]);
                make.centerX.equalTo(self).offset(0);
                
            }];
        }
    }
    [self.userAgreementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self).offset([self autoScaleH:24] * 2 + [self autoScaleW:40] + [self autoScaleH:35] + 20 - 15);
        make.centerX.equalTo(self).offset(0);
    }];
}

#pragma mark ==================按钮点击事件==================
- (void)clickAction:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickThirdLoginBtnAction:)]) {
        
        [self.delegate clickThirdLoginBtnAction:sender];
    }
}
#pragma mark ==================懒加载==================
-(UILabel *)loginWayLabel {
    
    if (!_loginWayLabel) {
        
        _loginWayLabel = [[UILabel alloc] init];
        _loginWayLabel.text = @"其他方式登录";
        [UILabel setLabelTextColor:kThemeColor AndFontSize:[self autoScaleW:12] WithLabel:_loginWayLabel];
        _loginWayLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _loginWayLabel;
}
-(UIView *)leftView {
    
    if (!_leftView) {
        
        _leftView = [[UIView alloc] init];
        _leftView.backgroundColor = kThemeColor;
    }
    return _leftView;
}
-(UIView *)rightView {
    
    if (!_rightView) {
        
        _rightView = [[UIView alloc] init];
        _rightView.backgroundColor = kThemeColor;
    }
    return _rightView;
}
-(UIButton *)weChatBtn {
    
    if (!_weChatBtn) {
        
        _weChatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_weChatBtn setImage:[UIImage imageNamed:@"login_weixin"] forState:(UIControlStateNormal)];
        _weChatBtn.tag = 6000;
        [_weChatBtn addTarget:self action:@selector(clickAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _weChatBtn;
}
-(UIButton *)qqBtn {
    
    if (!_qqBtn) {
        
        _qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qqBtn setImage:[UIImage imageNamed:@"login_qq"] forState:(UIControlStateNormal)];
        _qqBtn.tag = 6001;
        [_qqBtn addTarget:self action:@selector(clickAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _qqBtn;
}
-(UIButton *)userAgreementBtn {
    
    if (!_userAgreementBtn) {
        
        _userAgreementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_userAgreementBtn setTitle:@"登录即代表您已经同意西北隐私政策" forState:(UIControlStateNormal)];
        _userAgreementBtn.tag = 6002;
        [UIButton setBtnTextColor:UIColorFromRGBValue(0x666666) AndFontSize:[self autoScaleW:11] WithBtn:_userAgreementBtn];
        [_userAgreementBtn addTarget:self action:@selector(clickAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _userAgreementBtn;
}

@end
