//
//  LoginViewController.m
//  Component-based
//
//  Created by mac on 2018/4/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "LoginViewController.h"
#import "Public.h"
#import "PSLoginTopView.h"
#import "PSLoginView.h"
#import "PSThirdLoginView.h"

@interface LoginViewController ()<PSLoginViewDelegate,PSThirdLoginViewDelegate>

//顶部View
@property (nonatomic,strong) PSLoginTopView *loginPopView;
//中间登录View
@property (nonatomic,strong) PSLoginView *loginView;
//第三方登录View
@property (nonatomic,strong) PSThirdLoginView *thirdLoginView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UI相关设置
    [self setBaseUI];
    //键盘回收
    [self receiveKeyboard];
    //监听TextField
    [self addListenser];
}
#pragma mark ==================UI相关设置==================
- (void)setBaseUI {
    
    [self.view addSubview:self.loginPopView];
    [self.view addSubview:self.loginView];
    [self.view addSubview:self.thirdLoginView];
    
    [self.thirdLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.view).offset([self autoScaleH:261] +[self autoScaleH:169] + 70);
        make.width.equalTo(screenW);
        make.height.equalTo(screenH - ([self autoScaleH:261] +[self autoScaleH:169] + 70));
    }];
}
#pragma mark ==================键盘上移相关设置==================
- (void)receiveKeyboard {
    
    //键盘上移相关设置
    [IQKeyboardManager sharedManager].keyboardDistanceFromTextField = 100.0f;//键盘到textFileld的距离
    [IQKeyboardManager sharedManager].preventShowingBottomBlankSpace = NO;//防止过渡滑动
    
}
#pragma mark ==================添加监听事件==================
- (void)addListenser{
    
    //监听textField回调事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged) name:UITextFieldTextDidChangeNotification object:nil];
}
#pragma mark ==================监听回调==================
- (void)textDidChanged {
    
    //判断输入框的内容是否为空
    if (![self.loginView.accountTF.text isEqualToString:@""] && ![self.loginView.pwdTF.text isEqualToString:@""]) {
        
        [self.loginView.loginBtn setBackgroundColor:kThemeColor];
        [self.loginView.loginBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        self.loginView.loginBtn.userInteractionEnabled = YES;
    }else{
        
        [self.loginView.loginBtn setBackgroundColor:kBtnNormalColor];
        [self.loginView.loginBtn setTitleColor:UIColorFromRGBValue(0x333333) forState:(UIControlStateNormal)];
        self.loginView.loginBtn.userInteractionEnabled = NO;
        
    }
}
#pragma mark ==================协议代理==================
-(void)clickAction:(UIButton *)sender {
    
    switch (sender.tag) {
        case 5000:
        {
            [HUD showMessage:@"点击登录按钮"];
        }
            break;
        case 5001:
        {
            [HUD showMessage:@"点击注册按钮"];
        }
            break;
        case 5002:
        {
            [HUD showMessage:@"点击忘记密码按钮"];
        }
            break;
            
        default:
            break;
    }
}
-(void)clickThirdLoginBtnAction:(UIButton *)sender {
    
    switch (sender.tag) {
        case 6000:
        {
            [HUD showMessage:@"点击微信登录按钮"];
        }
            break;
        case 6001:
        {
            [HUD showMessage:@"点击qq登录按钮"];
        }
            break;
        case 6002:
        {
            [HUD showMessage:@"点击用户协议按钮"];
        }
            break;
            
        default:
            break;
    }
}
#pragma mark ==================懒加载==================
-(PSLoginTopView *)loginPopView {
    
    if (!_loginPopView) {
        
        _loginPopView = [[PSLoginTopView alloc] initWithFrame:CGRectMake(0, 0, screenW, [self autoScaleH:[self autoScaleH:261]])];
    }
    return _loginPopView;
}
-(PSLoginView *)loginView {
    
    if (!_loginView) {
        
        _loginView = [[PSLoginView alloc] initWithFrame:CGRectMake(0, [self autoScaleH:261], screenW, [self autoScaleH:169] + 70)];
        _loginView.delegate = self;
        _loginView.backgroundColor = [UIColor whiteColor];
    }
    return _loginView;
}
-(PSThirdLoginView *)thirdLoginView {
    
    if (!_thirdLoginView) {
        
        _thirdLoginView = [[PSThirdLoginView alloc] init];
        _thirdLoginView.backgroundColor = [UIColor whiteColor];
        _thirdLoginView.delegate = self;
    }
    return _thirdLoginView;
}
#pragma mark ==================移除通知==================
-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
