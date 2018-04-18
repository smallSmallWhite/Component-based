//
//  RegisterViewController.m
//  Component-based
//
//  Created by mac on 2018/4/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "RegisterViewController.h"
#import "Public.h"
#import "PSLoginTopView.h"
#import "RegisterView.h"

@interface RegisterViewController ()<PSLoginTopViewDelegate,RegisterViewDelegate>

//顶部View
@property (nonatomic,strong) PSLoginTopView *loginPopView;
//注册View
@property (nonatomic,strong) RegisterView *registerView;

@end

@implementation RegisterViewController

#pragma mark ==================视图生命周期==================
- (void)viewDidLoad {
    [super viewDidLoad];
    //UI相关设置
    [self setBaseUI];
    //添加监听事件
    [self addListenser];
    //键盘上移相关
    [self receiveKeyboard];
}
#pragma mark ==================UI相关设置==================
- (void)setBaseUI {
    
    [self.view addSubview:self.loginPopView];
    [self.view addSubview:self.registerView];
}
#pragma mark ==================添加监听事件==================
- (void)addListenser{
    
    //监听textField回调事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    //倒计时完成时的回调
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(timeOut:) name:@"timeIsOut" object:nil];
}
#pragma mark ==================监听回调==================
- (void)textDidChanged:(NSNotification *)notification {
    
    //判断手机号是否输入正确
    if ([notification.object isKindOfClass:[PSAccountTextField class]]) {
    
        if ([PSTools isMobileNumber:self.registerView.accountTF.text]) {

            //手机号输入正确
            [self.registerView.verifyCodeBtn setBackgroundColor:kThemeColor];
            [self.registerView.verifyCodeBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
            self.registerView.verifyCodeBtn.userInteractionEnabled = YES;

        }else{

            //手机号输入错误
            [self.registerView.verifyCodeBtn setBackgroundColor:kBtnNormalColor];
            [self.registerView.verifyCodeBtn setTitleColor:UIColorFromRGBValue(0x333333) forState:(UIControlStateNormal)];
            self.registerView.verifyCodeBtn.userInteractionEnabled = NO;
        }
    }
    
    //判断输入的内容是否为空
    if ([PSTools isMobileNumber:self.registerView.accountTF.text] && ![self.registerView.verifyTF.text isEqualToString:@""] && ![self.registerView.pwdTF.text isEqualToString:@""]) {
        
        //输入内容不为空
        [self.registerView.registerBtn setBackgroundColor:kThemeColor];
        [self.registerView.registerBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        self.registerView.registerBtn.userInteractionEnabled = YES;
        
    }else{
        
        //输入内容为空
        [self.registerView.registerBtn setBackgroundColor:kBtnNormalColor];
        [self.registerView.registerBtn setTitleColor:UIColorFromRGBValue(0x333333) forState:(UIControlStateNormal)];
        self.registerView.registerBtn.userInteractionEnabled = NO;
    }
}
- (void)timeOut:(NSNotification *)sender{
    
    [self.registerView.verifyCodeBtn setBackgroundColor:kThemeColor];
    [self.registerView.verifyCodeBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    self.registerView.verifyCodeBtn.userInteractionEnabled = YES;
}
#pragma mark ==================键盘上移相关设置==================
- (void)receiveKeyboard {
    
    //键盘上移相关设置
    [IQKeyboardManager sharedManager].keyboardDistanceFromTextField = 150.0f;//键盘到textFileld的距离
    [IQKeyboardManager sharedManager].preventShowingBottomBlankSpace = NO;//防止过渡滑动
    
}
#pragma mark ==================协议代理==================
-(void)clickBackAction:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)clickRegisterAction:(UIButton *)sender {
    
    switch (sender.tag) {
        case 5000:
        {
            //点击发送验证码按钮
            sender.countDownFormat= @"%d秒后重试";
            [sender countDownWithTimeInterval:60];
            [sender setTitleColor:UIColorFromRGBValue(0x333333) forState:(UIControlStateNormal)];
            [sender setBackgroundColor:kBtnNormalColor];
            sender.userInteractionEnabled = NO;
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
        _loginPopView.delegate = self;
    }
    return _loginPopView;
}
-(RegisterView *)registerView {
    
    if (!_registerView) {
        
        _registerView = [[RegisterView alloc] initWithFrame:CGRectMake(0,  [self autoScaleH:261], screenW, screenH - [self autoScaleH:261])];
        _registerView.delegate = self;
        _registerView.backgroundColor = [UIColor whiteColor];
    }
    return _registerView;
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
